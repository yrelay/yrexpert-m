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
;! Nomprog     : %QULELOM                                                     !
;! Module      : EDITEUR EN LIEN                                              !
;! But         : Création du graphe                                           !
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

%QULELOM ;
 
 
 
MAKEGRA 
 
 
 
 N TEMP,PILE,X,Y,Z,%I,%J,%K,CPT,VU,RAC,IRAC,CODEX,O,%O
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MAKE") K @(TEMP)
 S PILE=$$CONCAS^%QZCHAD(TEMP,"P")
 S VU=$$CONCAS^%QZCHAD(TEMP,"V")
 
 K @(GRAP),@(TRANSL)
 G:ORDO ORDO
 
 G:$$TYPEL^%QSGES90(LIEN)>3 ROOIN G:$$TYPEL^%QSGES90(LIEN)=2 ROOHI
 
 S RAC="" F %I=0:0 S RAC=$O(@GRAC@(RAC)) Q:RAC=""  D TRSL(RAC) I $$AIR^%QSGEST5(REP,RAC,LIEN) S X="" F %K=0:0 S X=$$NXTRIAO^%QSTRUC8(REP,RAC,LIEN,X) Q:X=""  S @GRAP@(RAC,X)="" D TRSL(X)
 G FMAKEG
ROOIN 
 
 S RAC="" F CPT=1:1 S RAC=$O(@GRAC@(RAC)) Q:RAC=""  S @PILE@(CPT)=RAC,@VU@(RAC)="" D TRSL(RAC)
 S %I=CPT,CPT=0
 
 F %K=0:0 S CPT=$O(@PILE@(CPT)) Q:CPT=""  S X=@PILE@(CPT) I $$AIR^%QSGEST5(REP,X,LIEN) S Y="" F %I=%I:1 S Y=$$NXTRIAO^%QSTRUC8(REP,X,LIEN,Y) Q:Y=""  S @GRAP@(X,Y)="" S:'($D(@VU@(Y))) @PILE@(%I)=Y,@VU@(Y)="" D TRSL(Y)
 G FMAKEG
TRSL(I) S @TRANSL@("CV",I)=I,@TRANSL@("VC",I)=I Q
ROOHI 
 S RAC="" F %I=0:0 S RAC=$O(@GRAC@(RAC)) Q:RAC=""  D TRSL(RAC) I $$AIR^%QSGEST5(REP,RAC,LIEN) S O="" F %O=0:0 S O=$$NXTRIAO^%QSTRUC8(REP,RAC,LIEN,O) Q:O=""  S X=$$VALEUR^%QSTRUC8(REP,RAC,LIEN,O),@GRAP@(RAC,RAC_","_X)="" D TRSL(RAC_","_X)
 G FMAKEG
 
ORDO S (LCPT,CPT)="" F %I=0:0 S CPT=$O(@GRAC@(CPT)) Q:CPT=""  S RAC=@GRAC@(CPT),@TRANSL@("CV",CPT)=RAC,@TRANSL@("VC",RAC)=CPT,LCPT=CPT
 G:$$TYPEL^%QSGES90(LIEN)>3 OROOIN G:$$TYPEL^%QSGES90(LIEN)=2 OROOHI
 
 S IRAC="" F %I=0:0 S IRAC=$O(@GRAC@(IRAC)) Q:IRAC=""  S RAC=@GRAC@(IRAC) I $$AIR^%QSGEST5(REP,RAC,LIEN) S X="" F %K=0:0 S X=$$NXTRIAO^%QSTRUC8(REP,RAC,LIEN,X) Q:X=""  D LIX
 G FMAKEG
LIX I '($D(@TRANSL@("VC",X))) S LCPT=LCPT+1,@TRANSL@("VC",X)=LCPT,@TRANSL@("CV",LCPT)=X
 S CODEX=@TRANSL@("VC",X),@GRAP@(IRAC,CODEX)=""
 Q
OROOIN 
 S IRAC="" F CPT=1:1 S IRAC=$O(@GRAC@(IRAC)) Q:IRAC=""  S @PILE@(CPT)=IRAC,@VU@(IRAC)=""
 S %I=CPT,CPT=0
 F %K=0:0 S CPT=$O(@PILE@(CPT)) Q:CPT=""  S XX=@PILE@(CPT),X=@TRANSL@("CV",XX) I $$AIR^%QSGEST5(REP,X,LIEN) S Y="" F %I=%I:1 S Y=$$NXTRIAO^%QSTRUC8(REP,X,LIEN,Y) Q:Y=""  D LIX2
 G FMAKEG
LIX2 I '($D(@TRANSL@("VC",Y))) S LCPT=LCPT+1,@TRANSL@("VC",Y)=LCPT,@TRANSL@("CV",LCPT)=Y
 S CODEX=@TRANSL@("VC",Y),@GRAP@(XX,CODEX)="" S:'($D(@VU@(CODEX))) @PILE@(%I)=CODEX,@VU@(CODEX)=""
 Q
OROOHI 
 S IRAC="" F %I=0:0 S IRAC=$O(@GRAC@(IRAC)) Q:IRAC=""  S RAC=@TRANSL@("CV",IRAC) I $$AIR^%QSGEST5(REP,RAC,LIEN) S O="" F %O=0:0 S O=$$NXTRIAO^%QSTRUC8(REP,RAC,LIEN,O) Q:O=""  S X=$$VALEUR^%QSTRUC8(REP,RAC,LIEN,O) D LIX3
 G FMAKEG
LIX3 S Y=RAC_","_X
 I '($D(@TRANSL@("VC",Y))) S LCPT=LCPT+1,@TRANSL@("VC",Y)=LCPT,@TRANSL@("CV",LCPT)=Y
 S CODEX=@TRANSL@("VC",Y),@GRAP@(IRAC,CODEX)=""
 Q
FMAKEG K @(TEMP)
 Q
 
 
AJGRA(XX,XY) 
 N TEMP,PILE,VU,CPT,%I,%K,X,Y,CODEX,LCPT,CPT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"AJ") K @(TEMP)
 S PILE=$$CONCAS^%QZCHAD(TEMP,"P"),VU=$$CONCAS^%QZCHAD(TEMP,"V")
 G:ORDO AJGRAOR
 S @GRAP@(XX,XY)=""
 
 I $$TYPEL^%QSGES90(LIEN)'>3 G AJGRAFI
 
 I $D(@GRAP@(XY))>9 G AJGRAFI
 S CPT=0,@PILE@(CPT)=XY,@VU@(XY)=""
 S %I=1,CPT=""
 F %K=0:0 S CPT=$O(@PILE@(CPT)) Q:CPT=""  S X=@PILE@(CPT) I $$AIR^%QSGEST5(REP,X,LIEN) S Y="" F %I=%I:1 S Y=$$NXTRIAV^%QSTRUC8(REP,X,LIEN,Y) Q:Y=""  S @GRAP@(X,Y)="" I '($D(@VU@(Y))) S @VU@(Y)="" I $D(@GRAP@(Y))<10 S @PILE@(%I)=Y
 G AJGRAFI
AJGRAOR 
 S LCPT=$ZP(@TRANSL@("CV",""))+1
 I '($D(@TRANSL@("VC",XY))) S @TRANSL@("CV",LCPT)=XY,@TRANSL@("VC",XY)=LCPT,LCPT=LCPT+1
 S @GRAP@(@TRANSL@("VC",XX),@TRANSL@("VC",XY))=""
 
 I $D(@GRAP@(@TRANSL@("VC",XY)))>9 G AJGRAFI
 
 S @PILE@(1)=@TRANSL@("VC",XY),@VU@(@TRANSL@("VC",XY))=""
 S %I=LCPT+1,CPT=0
 F %K=0:0 S CPT=$O(@PILE@(CPT)) Q:CPT=""  S X=@TRANSL@("CV",@PILE@(CPT)) I $$AIR^%QSGEST5(REP,X,LIEN) S Y="" F %I=%I:1 S Y=$$NXTRIAV^%QSTRUC8(REP,X,LIEN,Y) Q:Y=""  D AJLIX2
 G AJGRAFI
AJLIX2 I '($D(@TRANSL@("VC",Y))) S LCPT=LCPT+1,@TRANSL@("VC",Y)=LCPT,@TRANSL@("CV",LCPT)=Y
 S CODEX=@TRANSL@("VC",Y),@GRAP@(XX,CODEX)=""
 I '($D(@VU@(CODEX))) S @VU@(CODEX)="" I $D(@GRAP@(CODEX))>9 S @PILE@(%I)=CODEX
 Q
 
 
AJGRAFI K @(TEMP)
 Q
 ;

