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

;%TXH5^INT^1^59547,74031^0
%TXH5 ;
 
 
 
 s G="^[QUI]gop(ETUDE)",GJ="^[QUI]gop(ETUDE,job)"
 s P="^[QUI]propt(ETUDE)",PJ="^[QUI]propt(ETUDE,pro,seq,job,o)"
 s PROTERV="^[QUI]proterv(ETUDE)",aplto="^aplto($j,ETUDE)"
 s tot="^[QUI]gop(ETUDE,""total"")"
 s topt="^[QUI]gopt(ETUDE,""total"")"
 s jmax=@G@("jmax"),omax=@G@("omax"),promax=@G@("promax")
 f job=1:1:jmax s om=@GJ@("om") f o=1:1:om s s=^sol($j,ETUDE,job,o),TDEBUT=$p(s,"^",1),TLAST=$p(s,"^",2),pro=$p(s,"^",3) w:VISU=1 !,?5,job,?10,o,?15,pro,?20,TDEBUT,?28,TLAST
 f pro=1:1:promax s seq="" w:VISU=1 !," processeur ",pro,! f o=1:1 s seq=$o(@P@(pro,seq)) q:seq=""  q:(seq+0)'>0  s s=@P@(pro,seq),TDEBUT=$p(s,"^",1),TLAST=$p(s,"^",2),job=$p(s,"^",3),o=$p(s,"^",4) w:VISU=1 !,?5,TDEBUT,?10,TLAST,?15,job,?20,o,?28,"(",seq,")"
 s val=0
 f pro=1:1:promax s v1=$$pvl(pro) i v1>val s val=v1 w:VISU=1 !," processeur ",pro," val ",val
 w !,!," etude ",ETUDE," valeur ",val
 q
pvl(pro) 
 q $zp(@PROTERV@(pro,""))

