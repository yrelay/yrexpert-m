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

;%SDEDEF2^INT^1^59547,73888^0
SDEDEF2(NUM,ADR2,MODE,CONT,GLAFF,SYNT) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 I NUM="" D ^%VSQUEAK Q
 I (MODE'=1)&(MODE'=2) D ^%VSQUEAK Q
 I MODE=2 Q:'($$CONFIRM^%SDUMEN($$^%QZCHW("confirmation (O/N)")_" ? "_$$^%QZCHW("[N]")))
 N OK,TYPEL,TEMP,INFO,PRES
 S TYPEL=$$TYPELEM^%SDEGEST(OBJ,VERS,NUM)
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S INFO=$$CONCAS^%QZCHAD(TEMP,"INFO")
 S PRES=$$CONCAS^%QZCHAD(TEMP,"PRES")
 D PRES^%SDEGEST(NUM,INFO)
 G @ADR2
 
FIN 
 D GRAPH^%SDEDEF
 I %TERM="VT-340" D VT340^%SDEDEF
 I MODE=2 S NUM=""
 K @(TEMP)
 Q
KILL 
 D KILL^%SDEGES2(OBJ,VERS,NUM)
 D MAJMAT
 Q
 
MAJMAT 
 D KILL^%SDOMAT(NUM)
 Q
 
EXT1 S X1=@INFO@(1,"X"),Y1=@INFO@(1,"Y")
 Q
EXT2 D EXT1
 S X2=@INFO@(2,"X"),Y2=@INFO@(2,"Y")
 Q
EXT3 D EXT2
 S X3=@INFO@(3,"X"),Y3=@INFO@(3,"Y")
 Q
 
ALFA D ALFA^%SDEDEF Q
 
GRAPH D GRAPH^%SDEDEF Q
 
 
POINT 
 D EXT1
 I MODE=1 G POINT2
 
 D EFF^%SDESPNT(X1,Y1)
 S LIB=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),6)
 D ^%PBPZGRA,TEXTE^%PBMFN(X1+20,Y1+20,@INFO@("LIB"),1,"H"),EFF^%PBP5EC(0)
 D KILL
 G FIN
POINT2 
 D STOCK^%SDEDEF(1,X1,Y1,PRES)
 D ALFA
 S OK=$$^%SDESAIS(MODE,"POINT",PRES,CONT,GLAFF,.NUM,SYNT)
 I '(OK) G FIN
 I TYPEL=$$TYPELEM^%SDEGEST(OBJ,VERS,NUM) S LIB=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),6) D POINT^%SDEGEST(NUM,X1,Y1,LIB) G FIN
 D TEXTE^%PBMFN(X1+20,Y1+20,@INFO@("LIB"),1,"H"),EFF^%PBP5EC(0)
 G FIN
DROIT 
 D EXT2
 I MODE=1 G DROITE2
 
 D EFF^%SDESDRO(X1,Y1,X2,Y2,@CONT@("TRAIT"),@CONT@("VIS"))
 D KILL
 G FIN
DROITE2 
 D STOCK^%SDEDEF(1,X1,Y1,PRES),STOCK^%SDEDEF(2,X2,Y2,PRES)
 D ALFA
 S OK=$$^%SDESAIS(MODE,"DROITE",PRES,CONT,GLAFF,.NUM,SYNT)
 I '(OK) G FIN
 I TYPEL=$$TYPELEM^%SDEGEST(OBJ,VERS,NUM) S TYPL=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),3) D DROITE^%SDEGEST(NUM,X1,Y1,X2,Y2,TYPL),CREAPNT^%SDEDEF2(OBJ,VERS,GLAFF) G FIN
 D EFF^%SDESDRO(X1,Y1,X2,Y2,@CONT@("TRAIT"),@CONT@("VIS"))
 G RESAIS
TEXTE 
 D EXT1
 I MODE=1 G TEXTE2
 
 D ^%PBPZGRA,TEXTE^%PBMFN(X1,Y1,@INFO@("LIB"),1,"H"),EFF^%PBP5EC(0)
 D KILL
 G FIN
TEXTE2 
 D STOCK^%SDEDEF(1,X1,Y1,PRES)
 D ALFA
 S OK=$$^%SDESAIS(MODE,"TEXTE",PRES,CONT,GLAFF,.NUM,SYNT)
 I '(OK) G FIN
 S TAILLE=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),2)
 S INCL=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),6)
 I TYPEL=$$TYPELEM^%SDEGEST(OBJ,VERS,NUM) S LIB=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),5) D TEXTE^%SDEGEST(NUM,X,Y,LIB,INCL,TAILLE) G FIN
 D ^%PBPZGRA,TEXTE^%PBMFN(X1,Y1,@INFO@("LIB"),1,"H"),EFF^%PBP5EC(0)
 G RESAIS
ARC 
 D EXT3
 I MODE=1 G ARC2
 
 D EFF^%SDESARC(X1,Y1,X2,Y2,X3,Y3,@CONT@("TRAIT"),@CONT@("VIS"))
 D KILL
 G FIN
ARC2 
 D STOCK^%SDEDEF(1,X3,Y3,PRES),STOCK^%SDEDEF(2,X1,Y1,PRES),STOCK^%SDEDEF(3,X2,Y2,PRES)
 D ALFA
 S OK=$$^%SDESAIS(MODE,"ARC",PRES,CONT,GLAFF,.NUM,SYNT)
 I '(OK) G FIN
 I TYPEL=$$TYPELEM^%SDEGEST(OBJ,VERS,NUM) S TYPL=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),3) D ARC^%SDEGEST(NUM,X1,Y1,X2,Y2,X3,Y3,TYPL),CREAPNT^%SDEDEF2(OBJ,VERS,GLAFF) G FIN
 D EFF^%SDESARC(X1,Y1,X2,Y2,X3,Y3,@CONT@("TRAIT"),@CONT@("VIS"))
 G RESAIS
CERCL 
 D EXT2
 I MODE=1 G CER2
 
 D EFF^%SDESCER(X1,Y1,X2,Y2,@CONT@("TRAIT"),@CONT@("VIS"))
 S TYPL=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),3)
 D KILL
 G FIN
CER2 
 D STOCK^%SDEDEF(1,X1,Y1,PRES),STOCK^%SDEDEF(2,X2,Y2,PRES)
 D ALFA
 S OK=$$^%SDESAIS(MODE,"CERCLE",PRES,CONT,GLAFF,.NUM,SYNT)
 I '(OK) G FIN
 I TYPEL=$$TYPELEM^%SDEGEST(OBJ,VERS,NUM) S TYPL=$P(@GLOBJ@("EL",NUM,"SYNT"),$C(0),3) D CERCLE^%SDEGEST(NUM,X1,Y1,X2,Y2,TYPL),CREAPNT^%SDEDEF2(OBJ,VERS,GLAFF) G FIN
 D EFF^%SDESCER(X1,Y1,X2,Y2,@CONT@("TRAIT"),@CONT@("VIS"))
 G RESAIS
ELLIP 
 G ELLIP^%SDEDEF3
DEMIE 
 G DEMIE^%SDEDEF3
RECTA 
 G RECTA^%SDEDEF3
FLECH 
 G FLECH^%SDEDEF3
RACCO 
 G FIN
 
 
 
CREAPNT(OBJ,VERS,GLO) 
 N ORD,I,X,Y,LIB,NUM
 S ORD=""
LOOP S ORD=$O(@GLO@("C",ORD))
 Q:ORD=""
 S NUM=$$NOELPT^%SDEGEST(OBJ,VERS,ORD)
 Q:NUM=""
 S X=@GLO@("C",ORD,"X")*188E-1,Y=@GLO@("C",ORD,"Y")*188E-1,LIB="P"_ORD
 D ^%PBPZGRA,TEXTE^%PBMFN(X+20,Y+20,LIB,0,"H"),EFF^%PBP5EC(0)
 D POINT^%SDEGEST(NUM,X,Y,LIB),POINT^%SDOMAT(NUM,X1,Y1)
 G LOOP
 
 
 
 
RESAIS 
 D MAJMAT
 S TYPEL=$E($$TYPELEM^%SDEGEST(OBJ,VERS,NUM),1,5)
 D GRAPH
 D @(TYPEL_"^%SDEDEF(2,NUM,SYNT,PRES,GLAFF,1)")
 G FIN
 
MENU(MENEL) 
 N I S I=0
 S I=I+1
 S @MENEL@(I)=$$^%QZCHW("POINT")_"^"_"POINT"
 S I=I+1
 S @MENEL@(I)=$$^%QZCHW("DROITE")_"^"_"DROIT"
 S I=I+1
 S @MENEL@(I)=$$^%QZCHW("TEXTE")_"^"_"TEXTE"
 S I=I+1
 S @MENEL@(I)=$$^%QZCHW("ARC")_"^"_"ARC"
 S I=I+1
 S @MENEL@(I)=$$^%QZCHW("CERCLE")_"^"_"CERCL"
 S I=I+1
 S @MENEL@(I)=$$^%QZCHW("ELLIPSE")_"^"_"ELLIP"
 S I=I+1
 S @MENEL@(I)=$$^%QZCHW("DEMIE-ELLIPSE")_"^"_"DEMIE"
 S I=I+1
 S @MENEL@(I)=$$^%QZCHW("FLECHE")_"^"_"FLECH"
 S I=I+1
 S @MENEL@(I)=$$^%QZCHW("RACCORD")_"^"_"RACCO"
 S I=I+1
 S @MENEL@(I)=$$^%QZCHW("SYNTAXE")_"^"_"SYNTA"
 S I=I+1
 S @MENEL@(I)=$$^%QZCHW("SUPPRESSION")_"^"_"SUPP"
 S I=I+1
 Q

