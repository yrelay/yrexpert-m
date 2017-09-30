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

;%SDEDEF3^INT^1^59547,73888^0
SDEDEF3 ;
 
 
 
 
 
 
ALFA 
 D ALFA^%SDEDEF Q
 
GRAPH 
 D GRAPH^%SDEDEF Q
 
KILL 
 D KILL^%SDEDEF2 Q
 Q
 
EXT1 S X1=@INFO@(1,"X"),Y1=@INFO@(1,"Y")
 Q
EXT2 D EXT1
 S X2=@INFO@(2,"X"),Y2=@INFO@(2,"Y")
 Q
EXT3 D EXT2
 S X3=@INFO@(3,"X"),Y3=@INFO@(3,"Y")
 Q
 
 
 
FIN G FIN^%SDEDEF2
 
 
 
 
ELLIP 
 D EXT3
 I MODE=1 G ELLIP2
 
 D EFF^%SDESELL(X1,Y1,X2,Y2,X3,Y3,@CONT@("TRAIT"),@CONT@("VIS"))
 D KILL
 G FIN
ELLIP2 
 D STOCK^%SDEDEF(1,X1,Y1,PRES),STOCK^%SDEDEF(2,X2,Y2,PRES),STOCK^%SDEDEF(3,X3,Y3,PRES)
 D ALFA
 S OK=$$^%SDESAIS(MODE,"ELLIPSE",PRES,CONT,GLAFF,.NUM,SYNT)
 I '(OK) G FIN
 I TYPEL=$$TYPELEM^%SDEGEST(OBJ,VERS,NUM) S TYPL=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),3) D ELLIPS^%SDEGEST(NUM,X1,Y1,X2,Y2,X3,Y3,TYPL),CREAPNT^%SDEDEF2(OBJ,VERS,GLAFF) G FIN
 D EFF^%SDESELL(X1,Y1,X2,Y2,X3,Y3,@CONT@("TRAIT"),@CONT@("VIS"))
 G RESAIS^%SDEDEF2
DEMIE 
 D EXT3
 I MODE=1 G DEMIE2
 
 D EFF^%SDESDEL(X1,Y1,X2,Y2,X3,Y3,@CONT@("TRAIT"),@CONT@("VIS"))
 D KILL
 G FIN
DEMIE2 
 D STOCK^%SDEDEF(1,X1,Y1,PRES),STOCK^%SDEDEF(2,X2,Y2,PRES),STOCK^%SDEDEF(3,X3,Y3,PRES)
 D ALFA
 S OK=$$^%SDESAIS(MODE,"DEMIE.ELLIPSE",PRES,CONT,GLAFF,.NUM,SYNT)
 I '(OK) G FIN
 I TYPEL=$$TYPELEM^%SDEGEST(OBJ,VERS,NUM) S TYPL=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),3) D DEMEL^%SDEGEST(NUM,X1,Y1,X2,Y2,X3,Y3,TYPL),CREAPNT^%SDEDEF2(OBJ,VERS,GLAFF) G FIN
 D EFF^%SDESDEL(X1,Y1,X2,Y2,X3,Y3,@CONT@("TRAIT"),@CONT@("VIS"))
 G RESAIS^%SDEDEF2
RECTA 
 D EXT2
 I MODE=1 G RECT2
 
 D EFF^%SDESREC(X1,Y1,X2,Y2,@CONT@("TRAIT"),@CONT@("VIS"))
 D KILL
 G FIN
RECT2 
 D STOCK^%SDEDEF(1,X1,Y1,PRES),STOCK^%SDEDEF(2,X2,Y2,PRES)
 D ALFA
 S OK=$$^%SDESAIS(MODE,"RECTANGLE",PRES,CONT,GLAFF,.NUM,SYNT)
 I '(OK) G FIN
 I TYPEL=$$TYPELEM^%SDEGEST(OBJ,VERS,NUM) S TYPL=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),3),PLEIN=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),10) D RECT^%SDEGEST(NUM,X1,Y1,X2,Y2,TYPL,PLEIN),CREAPNT^%SDEDEF2(OBJ,VERS,GLAFF) G FIN
 D EFF^%SDESREC(X1,Y1,X2,Y2,@CONT@("TRAIT"),@CONT@("VIS"))
 G RESAIS^%SDEDEF2
FLECH 
 D EXT2
 I MODE=1 G FLEC2
 
 D EFFKILL^%SDESFLE(OBJ,VERS,NUM,X1,Y1,X2,Y2,@CONT@("TRAIT"),@CONT@("VIS"))
 D KILL
 G FIN
FLEC2 
 N ORIENT1,ORIENT2,TYPFL1,TYPFL2
 S ORIENT1=$$ORIENT^%SDEGEST(OBJ,VERS,NUM)
 S TYPFL1=$$TYPFL^%SDEGEST(OBJ,VERS,NUM)
 D STOCK^%SDEDEF(1,X1,Y1,PRES),STOCK^%SDEDEF(2,X2,Y2,PRES)
 D ALFA
 S OK=$$^%SDESAIS(MODE,"FLECHE",PRES,CONT,GLAFF,.NUM,SYNT)
 I '(OK) G FIN
 I TYPEL'=$$TYPELEM^%SDEGEST(OBJ,VERS,NUM) G FLEC3
 S TYPL=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),3) D FLECHE^%SDEGEST(NUM,X1,Y1,X2,Y2,TYPL),CREAPNT^%SDEDEF2(OBJ,VERS,GLAFF)
 S ORIENT2=$$ORIENT^%SDEGEST(OBJ,VERS,NUM),TYPFL2=$$TYPFL^%SDEGEST(OBJ,VERS,NUM)
 D GRAPH
 I (TYPFL1=TYPFL2)&(ORIENT1=ORIENT2) G FIN
 D EFFEXT^%SDESFLE(OBJ,VERS,NUM,X1,Y1,X2,Y2,TYPFL1,ORIENT1)
 D REAF^%SDESFLE(OBJ,VERS,NUM,X1,Y1,X2,Y2,@CONT@("TRAIT"),@CONT@("VIS"))
 G FIN
FLEC3 D EFFKILL^%SDESFLE(OBJ,VERS,NUM,X1,Y1,X2,Y2,@CONT@("TRAIT"),@CONT@("VIS"))
 G FIN
RACCO 
 N EL1,EL2
 S EL1=@INFO@(1,"DROITE"),EL2=@INFO@(2,"DROITE")
 D EXT2
 I MODE=1 G RACCO2
 
 D EFF^%SDESFLE(OBJ,VERS,X1,Y1,X2,Y2,EL1,EL2,@CONT@("TRAIT"),@CONT@("VIS"))
 D KILL
 G FIN
RACCO2 
 N TYPFL1,TYPFL2
 D STOCK^%SDEDEF(1,X1,Y1,PRES),STOCK^%SDEDEF(2,X2,Y2,PRES)
 D ALFA
 S OK=$$^%SDESAIS(MODE,"RACCORDEMENT",PRES,CONT,GLAFF,.NUM,SYNT)
 I '(OK) G FIN
 D CREAPNT^%SDEDEF2(OBJ,VERS,GLAFF)
 S TYPL=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),3) D RACCO^%SDEGEST(NUM,X1,Y1,X2,Y2,EL1,EL2,TYPL)
 D GRAPH
 G FIN

