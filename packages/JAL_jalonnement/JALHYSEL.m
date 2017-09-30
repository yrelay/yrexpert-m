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

;JALHYSEL^INT^1^59547,74867^0
JALHYSEL(MACHINE) 
 
 
 
 
 
 N VT,VR,OPM,J,OP,PERE,OPE,OR,ARC,OP1,OVR,NVR
 D ON^%VZEATT
 Q:REPI'=$$OP^JALRPJ
 D JAL^JALRQMAJ(^DESC($J,%L),.OPM)
 S PERE=$$NOMPERE^%QSGES10($$OP^JALRPJ,^DESC($J,%L))
 S VT=$$VAL^%HXYISTO(FTOT,REPI,^DESC($J,%L),T)
 S VR=$$VAL^%HXYISTO(FREG,REPI,^DESC($J,%L),R)
 S ^DESC($J,%L,T)=$$SYN^%HXYISTO(FSYN,"ZHYZCO",REPI,T,VT)
 S ^DESC($J,%L,R)=$$SYN^%HXYISTO(FSYN,"ZHYZCO",REPI,R,VR)
 S OR=$O(OPM(""))
 F J=0:0 Q:OR=""  D T S OR=$O(OPM(OR))
 S REAFF=1,SORTIE=0 D OFF^%VZEATT
 Q
T 
 S OP1=$$NOMFILS^%QSGES10($$GAMME^JALRPJ,PERE,$$OP^JALRPJ,OPM(OR,1))
 I $$^%QSCALVA($$OP^JALRPJ,OP1,"MACHINE")'=MACHINE Q
 I ($D(@IMOD@(OP1))#10)=1 S OPM(OR)=$P(@IMOD@(OP1),"^",1)_"^"_$P(OPM(OR),"^",2)
 S @IMOD@(OP1)=OPM(OR)
 Q

