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

;%JRNGES^INT^1^59547,73870^0
%JRNGES ;;04:18 PM  14 Sep 1992; 14 Sep 92  4:17 PM ; 15 Sep 92 12:02 PM
 
 
 
SUPPJ(JOURN) K ^[QUI]JOURNYXP(JOURN) Q
 
AJL(JOURN,LIGNE) 
 N GLOJ,NL,DATE,HEURE
 S GLOJ=$$CONCAS^%QZCHAD("^[QUI]JOURNYXP",JOURN)
 S NL=@GLOJ@("NL")+1,@GLOJ@("NL")=NL
 S @GLOJ@("TXT",NL)=LIGNE
 S DATE=$H,HEURE=$P(DATE,",",2),DATE=$P(DATE,",")
 G:('($D(@GLOJ@("DATEMM"))))!('($D(@GLOJ@("HEUREMM")))) MAJH
 I @GLOJ@("DATEMM")'=DATE G MAJH
 I @GLOJ@("HEUREMM")=HEURE Q
 S @GLOJ@("TXT",NL,"HEURE")=$$HEURE^%QMDATE
 S @GLOJ@("HEUREMM")=HEURE Q
MAJH S @GLOJ@("DATEMM")=DATE,@GLOJ@("HEUREMM")=HEURE,@GLOJ@("TXT",NL,"DATE")=$$DATE^%QMDATE,@GLOJ@("TXT",NL,"HEURE")=$$HEURE^%QMDATE
 Q
 
CREJOURN(TYPE,COMMENT) 
 N JOURN,GLOJ
 S JOURN=$$GEN^%QCAPOP("JRN")
 S GLOJ=$$CONCAS^%QZCHAD("^[QUI]JOURNYXP",JOURN)
 S @GLOJ@("TYPE")=TYPE
 S @GLOJ@("COMMENT")=COMMENT
 S @GLOJ@("NL")=0
 S @GLOJ@("DATE.CREATION")=$$DATE^%QMDATE
 Q JOURN
 
 
VISU(JOURN,XG,YH,DH,DV) 
 N GLOJ
 S GLOJ=$$CONCAS^%QZCHAD("^[QUI]JOURNYXP",JOURN)
 D CLFEN^%VVIDEO(XG,YH,DV,DH),CARSA^%VVIDEO(XG,YH,DH,DV)
 D REAFF^%QULIMO3(1,1,$$CONCAS^%QZCHAD(GLOJ,"TXT"),XG,YH,DH,DV)
 D VISU^%QULIMO(XG,YH,DH,DV,$$CONCAS^%QZCHAD(GLOJ,"TXT"),1)
 Q
 ;
 ;

