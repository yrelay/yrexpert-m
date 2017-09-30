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

;%SDOCON^INT^1^59547,73889^0
SDOCON ;
 
 
 
 
 
 D CLEPAG^%VVIDEO
 N TIT,OBJ,VERS,NOBJ,NVERS,SUP,X,CTR,LIB,TRACE
 S TIT=$$^%QZCHW("generation automatique de connaissance")
SAISOBJ 
 D ^%SDOBJ(TIT,1,.OBJ,.VERS)
 
 I OBJ="" Q
 
SAISP0 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("objet graphique")_" : "_OBJ_"   "_$$^%QZCHW("version")_" : "_VERS,0)
 D BLD^%VVIDEO S DX=0,DY=2 X XY W "parametres d'execution" D NORM^%VVIDEO
SAISP1 K Y
 S DX=32,DY=3 X XY W "mode de creation"
 S DY=DY+1 D CLEBAS^%VVIDEO
 S %R=5,LIB="avec suppression,sans suppression"
 S X=$$CENTRER(LIB)-2
 S Y=X_"\CBLHD\2\\\"_LIB
 D ^%PKPOP
 G:(CTR="A")!(CTR="F") SAISOBJ
 G:CTR'="" SAISP1
 
 I X=1 S SUP=1 G SAISP2
 I X=2 S SUP=0 G SAISP2
 G SAISP1
 
SAISP2 
 K Y
 S DX=33,DY=8 X XY W "nom de l'objet"
 S DY=DY+1 D CLEBAS^%VVIDEO
 S %R=10,LIB=OBJ_",attribut,variable.temporaire"
 S X=$$CENTRER(LIB)-2
 S Y=X_"\CBLHD\3\\\"_LIB
 D ^%PKPOP
 G:(CTR="A")!(CTR="F") SAISP1
 G:CTR'="" SAISP2
 
 I X=1 S NOBJ=""""_OBJ_"""" G SAISP3
 I X=2 D SAISVAL(1,.NOBJ,.OK) G:'(OK) SAISP2 G SAISP20
 I X=3 D SAISVAL(2,.NOBJ,.OK) G:'(OK) SAISP2 G SAISP20
 G SAISP2
SAISP20 
 D AFFLIB(NOBJ,12)
 
SAISP3 
 K Y
 S DX=32,DY=14 X XY W "nom de la version"
 S DY=DY+1 D CLEBAS^%VVIDEO
 S %R=16,LIB=VERS_",attribut,variable.temporaire"
 S X=$$CENTRER(LIB)-2
 S Y=X_"\CBLHD\3\\\"_LIB
 D ^%PKPOP
 G:(CTR="A")!(CTR="F") SAISP1
 G:CTR'="" SAISP2
 
 I X=1 S NVERS=""""_VERS_"""" G SAISP4
 I X=2 D SAISVAL(1,.NVERS,.OK) G:'(OK) SAISP2 G SAISP30
 I X=3 D SAISVAL(2,.NVERS,.OK) G:'(OK) SAISP2 G SAISP30
 G SAISP3
SAISP30 
 D AFFLIB(NVERS,18)
 
SAISP4 
 K Y
 S DX=32,DY=19 X XY W "analyse visible"
 S DY=DY+1 D CLEBAS^%VVIDEO
 S %R=21,LIB="non,oui"
 S X=$$CENTRER(LIB)-2
 S Y=X_"\CBLHD\3\\\"_LIB
 D ^%PKPOP
 G:(CTR="A")!(CTR="F") SAISP3
 G:CTR'="" SAISP3
 
 I X=1 S TRACE=0 G FINSAI
 I X=2 S TRACE=1 G FINSAI
 G SAISP4
FINSAI 
 D POCLEPA^%VVIDEO I '($$CONFIRM^%VZEOUI("confirmation")) G SAISP0
 D EXT(OBJ,VERS,NOBJ,NVERS,SUP,TRACE)
 G SAISOBJ
 
SAISVAL(CAS,VAL,OK) 
 S OK=1,VAL=""
 D POCLEPA^%VVIDEO
 I CAS=1 D LIRE2^%VREAD("nom de l'attribut"_" : ","",1,RM-4,DY+1,DY-1,"","$$CTR1^%SDOCON",.CTR,.VAL)
 I CAS=2 D LIRE2^%VREAD("nom de l'attribut"_" : ","",1,RM-4,DY+1,DY-1,"","$$CTR2^%SDOCON",.CTR,.VAL)
 I VAL="" S OK=0
 Q
CTR1(Y1,REAF) 
 N REP,MOT
 S REAF=0
 Q:Y1="" 1
 S REP=$$LEX^%LXSTOCK(Y1,.MOT)
 I REP=0 Q 0
 I REP=2 Q 0
 S Y1=MOT,REAF=1
 Q 1
CTR2(Y1,REAF) 
 S REAF=0
 Q:Y1="" 1
 I $E(Y1,1)'="%" D ^%VZEAVT("le nom de la variable doit commencer par %") Q 0
 Q 1
 
AFFLIB(M,DY) 
 S DX=$$CENTRER(M)
 D REV^%VVIDEO X XY W M D NORM^%VVIDEO
 Q
 
CENTRER(LIB) 
 Q 40-($L(LIB)\2)
 
 
 
 
 
 
 
 
 
 
 
EXT(OBJ,VERS,NOBJ,NVERS,SUP,TRACE) 
 Q:(OBJ="")!(VERS="")
 I SUP="" S SUP=0
 S:NOBJ="" NOBJ=""""_OBJ_""""
 S:NVERS="" NVERS=""""_VERS_""""
 S:TRACE="" TRACE=0
 I TRACE D CLEPAG^%VVIDEO
 D POCLEPA^%VVIDEO,MSG^%VZEATT($$^%QZCHW("analyse en cours"))
 
 N EL,TRT,REGLE,NUM,I,NBR,CH
 S STO=$$TEXT^%SDOCMS(OBJ,VERS)
 S TRT="SDX.OBJET."_OBJ_"."_VERS
 S REGLE="^[QUI]TTL("""_TRT_""",2)" K @(REGLE)
 S ^[QUI]TTL(TRT,"ANALYSE.CORRECTE")=0
 S ^[QUI]TTL(TRT,"DATE.CREATION")=$$DATE^%QMDATE
 
 S NUM=""
 F I=1:1 S NUM=$O(@STO@("COM",NUM)) Q:NUM=""  Q:NUM="COM"  S @REGLE@(NUM)=@STO@("COM",NUM),@REGLE@(NUM,"EXI")=1
 S NUM=""
 F I=1:1 S NUM=$O(@STO@(NUM)) Q:NUM=""  Q:NUM="COM"  D INS
 I '(SUP) G EXT1
 S NUM=""
 F I=1:1 S NUM=$ZP(@REGLE@(NUM)) Q:NUM=""  S @REGLE@(NUM+2)=@REGLE@(NUM)
 S @REGLE@(1)=":   suppresion de l'objet avant sa creation"
 S @REGLE@(2)="$SUPPRIMER.OBJET( "_NOBJ_" ; "_NVERS_" )"
EXT1 S COM="^[QUI]TTL("""_TRT_""",1)" K @(COM)
 S @COM@(1)="traitement genere automatiquement par SDX"
 S @COM@(2)="le : "_$$TEMPS^%QMDATE
 S OK=$$^%TLIANAL(TRT,TRACE,0,.NBR)
 I '(OK) Q
 S ^[QUI]TTL(TRT,"ANALYSE.CORRECTE")=1
 Q
 
INS 
 I $D(@REGLE@(I)) S I=I+1 G INS
 S CH=@STO@(NUM),TYP=$P(CH," ; ",2)
 Q:TYP=""
 I TYP="RACCORDEMENT" D POINT(.CH,6),POINT(.CH,8) S CH=CH_" " G INS1
 S EL=$P(CH," ; ",1),CH=CH_" " D TRADPT(EL,.CH)
 I TYP="TEXTE" D TEXTE(.CH)
INS1 S CH2=$P(CH," ; ",1)_" ; "_$P(CH," ; ",3,99)
 S SYNTAX="$CREER."_TYP_"( "_NOBJ_" ; "_NVERS_" ; "_CH2_")"
 S @REGLE@(I)="%ELEMENT = "_SYNTAX
 Q
 
TRADPT(EL,CH) 
 N PT,GLO,NOMPT,I
 S PT="",GLO=$$DEF^%SDOCMS(OBJ,VERS)
 F I=0:0 S PT=$O(@GLO@("PAEI",EL,PT)) Q:PT=""  S NOMPT="P"_PT,CH=$$ZSUBST^%QZCHSUB(CH," "_NOMPT_" "," """_NOMPT_""" ")
 Q
 
POINT(CH,POS) 
 N PT1,PT2,LIMIT
 S PT1=$P(CH," ; ",POS),LIMIT=$L(CH," ; ")
 S PT2=""""_PT1_""""
 I POS'=LIMIT S CH=$P(CH," ; ",1,POS-1)_" ; "_PT2_" ; "_$P(CH," ; ",POS+1,99)
 I POS=LIMIT S CH=$P(CH," ; ",1,POS-1)_" ; "_PT2
 Q
 
TEXTE(CH) 
 I ((CH'["$SYMBOLE")&(CH'["$BAS"))&(CH'["$HAUT") Q
 
 S TEXTE=$P(^[QUI]SDOBJ(OBJ,VERS,"EL",NUM,"SYNT"),$C(0),5)
 S TEXTE2=""""_$$ZSUBST^%QZCHSUB(TEXTE,"""","""""")_""""
 S CH=$$ZSUBST^%QZCHSUB(CH,TEXTE,TEXTE2)
 Q

