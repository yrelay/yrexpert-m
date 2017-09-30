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

;%SDOCTEX^INT^1^59547,73889^0
SDOCTEX ;
 
 
 
 
 
 
 
 
 
 
 N COND,CTR,Y1
DEB 
 D SEL(0,9,"definition d'une fiche de conditions",.COND)
 Q:COND=""
 D EXT(COND)
 G DEB
 
 
EXT(COND) 
 N GLO,GLCOMP
 S GLO="^[QUI]SDCOND(COND,""LIGNE"")"
 S GLCOMP="^[QUI]SDCOND(COND)"
 
 D AFF
 
 N PLIG,%PROVEN S PLIG=1,%PROVEN="SD"
 D ZLISTE4^%QULIMO(0,7,79,10,GLO,.PLIG,"ADD^%SDOCTEX","SUP^%SDOCTEX","^%QULIMO7",GLCOMP)
 I $$EXISTE(COND) S ^[QUI]SDCOND(COND,"DER.ACCES")=$$TEMPS^%QMDATE
 D MAJVAR(COND)
 Q
 
AFF D CLEPAG^%VVIDEO,CADR
 D REAFF^%QULIMO3(1,1,GLO,0,7,79,10)
 Q
 
CADR D CLEPAG^%VVIDEO
 D BLD^%VVIDEO,^%VZCDB("definition d'une fiche de conditions",0)
 D CARSP^%VVIDEO(0,2,3,79,0)
 S DX=2,DY=3 X XY W "nom de la fiche"_" : "_COND
 D CARSP^%VVIDEO(0,7,10,79,0)
 D BLD^%VVIDEO,^%VZCDB("S   D   X",21)
 Q
 
ADD N CHAINE,TETE,POSIT,SX,SY,VVDX,VVDY,VVYB,VVYH,VVPA,VVTX,ATTD,APPD
 S CHAINE=Y1,POSIT=1,SX=DX,SY=DY D INIT^%AN7(SX,SY)
 S TETE=$$VAL^%QULYSTE("TETE") I TETE'="" D KILL^%ANA(TETE)
 
 N %COMPIL
 S %COMPIL="",(ATTD,APPD)=0
 S OK=$$ANA(Y1,1)
 I '(OK) G AJ2
 S DX=SX,DY=SY X XY
 S OK=1 S:%COMPIL=" " %COMPIL=""
 S ^[QUI]SDCOND(COND,"COMP",P1C)=%COMPIL
AJ2 S Y1=CHAINE
 Q
 
SUP 
 N TETE
 S TETE=$$VAL^%QULYSTE("TETE") I TETE'="" D KILL^%ANA(TETE)
 S OK=1
 Q
 
REAFF 
 K RESUL,PATOUCH,AFRESU,DEJALU,REFUSE,STOPUC,CMS,ABENDSCR
 D CLEPAG^%VVIDEO,CADR
 D REAFF^%QULIMO3(1,1,GLO,0,7,79,10)
 D A18^%QULIMO4
 D REAFF^%AN7
 Q
 
EXISTE(COND) 
 I '($D(^[QUI]SDCOND(COND))) Q 0
 Q 1
 
 
 
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
 
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
ANA(CH,VISU) 
 N TEMPO,RESULT,NORES,CO,I,L,N,P
 N %COMPCOMP,%COMP1,%COMP2,%COMP3,%COMP4,%COMP5,%NEG,%GDX
 N %I,LET,MET,NOCOMPIL,ATTD,APPD,APPEX
 K ^SANAREQ($J)
 S (ATTD,APPD,APPEX)=0
 S NOCOMPIL=0
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 I VISU=1 D INIT^%AN7(SX,SY)
 I VISU=0 D INIT2^%AN7(SX,SY)
 S NORES=0,RESULT=1,P=1
 D INIT^%ANGEPIL
 D EMPIL^%ANGEPIL("FCOND^%SDOCTEX")
 G COND^%AN4
 
FCOND G:'(RESULT) ERRLIG
 D CAR
 I C'="" S MERR=$$^%QZCHW("Caracteres en trop a la fin de la ligne") G MERLIG
 S OK=1
 
FINLIG D END^%AN7,KILL^%ANA(NORES)
 K @(TEMPO)
 Q OK
 
MERLIG G:'(ERRMES) ERRLIG
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(MERR) H 2
 D POCLEPA^%VVIDEO
 
ERRLIG S %COMPIL="",OK=0
 G FINLIG
 
MAJVAR(COND) 
 I '($D(^DOC($J))) Q
 N %V,VART,GLO
 S GLO="^[QUI]SDCOND(COND)"
 S VART=""
 F %V=0:0 S VART=$O(^DOC($J,"%",VART)) Q:VART=""  S @GLO@("VAR",VART)=""
 F %V=0:0 S VART=$O(^DOC($J,"%INDIVIDU",VART)) Q:VART=""  S @GLO@("IND",VART)=""
 
 I $D(^DOC($J,"ATT")) S @GLO@("ATT")=""
 K ^DOC($J)
 Q
 
DUP 
 N COND2,COND1
DUP0 
 D SEL(0,4,"duplication de fiches de conditions",.COND1)
 Q:COND1=""
DUP1 
 D CARSP^%VVIDEO(0,11,3,79,0)
 S DX=2,DY=12 X XY D LIRE2^%VREAD("nom de la nouvelle fiche"_" : ","",1,RM-4,DY+1,DY-1,"","$$CTR2^%SDOCTEX",.CTR,.COND2)
 I (COND2="")!(CTR'="") G DUP0
 D COPIE(QUI,COND1,QUI,COND2)
 G DUP0
 
CTR2(Y1,REAF) 
 S REAF=0
 Q:Y1="" 1
 Q:Y1="?" 0
 I $$EXISTE(Y1) D ^%VZEAVT("fiche existante") Q 0
 Q 1
 
COPIE(QUI1,COND1,QUI2,COND2) 
 K ^[QUI2]SDCOND(COND2)
 S NOMTREE="^[QUI1]SDCOND("""_COND1_"""",%TREECOP="^[QUI2]SDCOND("""_COND2_"""" D ^%QCAGLC
 Q
 
DEL 
 N COND,CTR
DEL0 D SEL(0,9,"suppression de fiche de conditions",.COND)
 Q:COND=""
 D POCLEPA^%VVIDEO I '($$CONFIRM^%VZEOUI("suppression"_" : ")) G DEL0
 K ^[QUI]SDCOND(COND)
 G DEL0
 
SEL(XG,YH,LIB,COND) 
 N CTR,Y1
 S COND=""
 D CLEPAG^%VVIDEO
 D BLD^%VVIDEO,^%VZCDB(LIB,0),BLD^%VVIDEO,^%VZCDB("S   D   X",21)
 D CARSP^%VVIDEO(XG,YH,3,79,0)
 S DX=2,DY=YH+1 X XY D LIRE2^%VREAD("nom de la fiche"_" : ","",1,RM-4,DY+1,DY-1,"","$$CTR1^%SDOCTEX",.CTR,.COND)
 I CTR'="" S COND=""
 D CARSP^%VVIDEO(XG,YH,3,79,0)
 Q
CTR1(Y1,REAF) 
 N REP
 S REAF=0
 Q:Y1="" 1
 I Y1="?" G CHOIX
 I '($$EXISTE(Y1)) G CREA
 Q 1
CHOIX 
 D INIT^%QUCHOIP("^[QUI]SDCOND","",1,0,7,79,10),AFF^%QUCHOIP
 S Y1=$$UN^%QUCHOIP
 D END^%QUCHOIP
 D CLFEN^%VVIDEO(0,7,10,79)
 Q 1
 
CREA 
 D POCLEPA^%VVIDEO I '($$CONFIRM^%VZEOUI("fiche inconnue, voulez-vous la creer")) Q 0
 Q 1
 
ALL(TRACE) 
 N GLO,COND,LI,%PROVEN,Y1
 S GLO="^[QUI]SDCOND",%PROVEN="SD"
 I '(TRACE) D MSG^%VZEATT("analyse en cours"_" ...")
 I TRACE D CLEPAG^%VVIDEO
 S COND=""
LOOP1 S COND=$O(@GLO@(COND))
 G:COND="" FINALL
 I TRACE D REV^%VVIDEO W !,!,COND D NORM^%VVIDEO
 S LI=""
LOOP2 S LI=$O(@GLO@(COND,"LIGNE",LI))
 I LI="" G FLOOP2
 K @GLO@(COND,"COMP",LI)
 S Y1=@GLO@(COND,"LIGNE",LI)
 D ALL0(Y1)
 G LOOP2
FLOOP2 
 K @GLO@(COND,"%"),@GLO@(COND,"%INDIVIDU"),@GLO@(COND,"ATT")
 D MAJVAR(COND)
 G LOOP1
FINALL D ^%VZEAVT("analyse terminee")
 Q
ALL0(Y1) 
 W:TRACE !,"ligne no ",LI," : ",Y1
 N CHAINE,TETE,POSIT,SX,SY,VVDX,VVDY,VVYB,VVYH,VVPA,VVTX,ATTD,APPD
 S CHAINE=Y1,POSIT=1,SX=0,SY=0
 N %COMPIL
 S %COMPIL="",(ATTD,APPD)=0
 S OK=$$ANA(Y1,0)
 I '(OK) W:TRACE !,"erreur !",! Q
 W:TRACE !,"analyse ok !",!
 S:%COMPIL=" " %COMPIL=""
 S @GLO@(COND,"COMP",LI)=%COMPIL
 Q

