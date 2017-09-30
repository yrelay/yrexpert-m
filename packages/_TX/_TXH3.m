;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%TXH3^INT^1^59547,74031^0
%TXH3 ;
 
 
 
 S G="^[QUI]gop(ETUDE)",GJ="^[QUI]gop(ETUDE,job)"
 S P="^[QUI]propt(ETUDE)",PJ="^[QUI]propt(ETUDE,pro,seq,job,o)"
 S PROTERV="^[QUI]proterv(ETUDE)",aplto="^aplto($j,ETUDE)"
 S tot="^[QUI]gop(ETUDE,""total"")"
 S topt="^[QUI]gopt(ETUDE,""total"")"
 S jmax=@G@("jmax"),omax=@G@("omax"),promax=@G@("promax")
 
 
 K @(P),@(PROTERV)
 
 F pro=1:1:promax D INIT^%TXH4(pro,0,32640)
 F job=1:1:jmax S @aplto@(job)=0
 
 D GLOCOP^%QCAGLC("^[QUI]goo","^[QUI]gopt")
 
 S DECI=0 D ^VTIME
deux 
 
 S TOT=$ZP(@topt@("")) I TOT="" G fin
 S job=$O(@topt@(TOT,""))
 S o=$O(@topt@(TOT,job,""))
 S pro=$O(@topt@(TOT,job,o,"")),tp=@GJ@(o,pro)
 W:VISU=1 !,?5,job,?10,o,?15,pro,?25,tp
 I '($D(@P@(pro,"seq"))) S seq=0,@P@(pro,"seq")=seq
 S seq=@P@(pro,"seq")
 S seq=seq+1,@P@(pro,"seq")=seq
 S @PJ="",REUSSITE=$$GET^%TXH4(pro,@aplto@(job),32640,tp,1)
 W:VISU=1 !," sur le processeur ",pro," en sequence ",seq," duree  ",tp
 W:VISU=1 !,?5,job,?10,o,?15,pro,?25,tp,?32,TDEBUT,?42,TLAST
 S @aplto@(job)=TLAST
 
 S DECI=DECI+1
 
 
 S ^sol($J,ETUDE,job,o)=TDEBUT_"^"_TLAST_"^"_pro
 S @P@(pro,seq)=TDEBUT_"^"_TLAST_"^"_job_"^"_o
 K @topt@(TOT,job,o,pro)
 G deux
 Q
fin ;;
 
 D AFF^VTIME W !,!," deci ",DECI," duree ",DELTA

