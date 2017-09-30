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

;%DLAFMI2^INT^1^59547,73867^0
DLAFMI2(DESSIN,GL) 
 
 
 
 
 
 N %C,CH,CPT,GLO,GLOBAL,MAX,VAL
 
 S GLOBAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLOBAL") K @(GLOBAL)
 D ^%VZEATT
 S @GLOBAL@("TEXT",1)=$$^%QZCHW("MIX sur")_" "_$S(TYP="C":$$^%QZCHW("le carnet de commande"),1:$$^%QZCHW("l'etude")_" "_ETU)_$J(" ",25)_$$^%QZCHW("Le")_" "_$$DATE^%QMDATE_$$^%QZCHW(" a ")_$$HEURE^%QMDATE
 S @GLOBAL@("TEXT",2)=$$^%QZCHW("Attribut de repartition")_" : "_ATR
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLO") K @(GLO)
 
 S CPT=""
 F %C=1:1 S CPT=$O(@GL@(CPT)) Q:CPT=""  S VAL=@GL@(CPT,"TEXT"),@GLO@(VAL)=@GL@(CPT)
 
 S (MAX,CPT)=0,VAL=""
 F %C=1:1 S VAL=$O(@GLO@(VAL)) Q:VAL=""  D TO
 S @GLOBAL@("NBCOL")=CPT
 S @GLOBAL@("HAUTEUR-MAX")=MAX
 K @(GLO)
 G DESSIN
 
TO S CH=@GLO@(VAL)
 S CH=$J((CH/@GL)*100,1,2),CPT=CPT+1
 S @GLOBAL@("COL",CPT,"TEXT")=VAL
 S @GLOBAL@("COL",CPT)=CH
 S:CH>MAX MAX=CH
 Q
 
DESSIN 
 N I,%PORT,%TERM,%FONC,MEN2,ADR,CTR
 S MEN2=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MEN2") K @(MEN2)
 S @MEN2@(1)=$$^%QZCHW("Ecran graphique")_"^X69"
 S @MEN2@(2)=$$^%QZCHW("Imprimante graphique")_"^X73"
ACTD D POCLEPA^%VVIDEO,^%VQUIKMN(5,79,23,MEN2,.ADR,.CTR)
 I (CTR="A")!(CTR="F") K @(MEN2),@(GLOBAL) Q
 I ADR'="" G @ADR
 G ACTD
X69 S %PORT=^TABIDENT(WHOIS,"ECRGRA"),%TERM=^TABIDENT(WHOIS,"TYPECR")
 D GO,^%PBPZALF,^%VZEAVT("")
 D ^%PBPZGRA,^%PBPZCLR,^%PBPZALF,NORM^%VVIDEO G ACTD
X73 S %PORT=^TABIDENT(WHOIS,"TABTRA"),%TERM=^TABIDENT(WHOIS,"TYPTAB")
 D MSG^%VZEATT("Edition en cours ..."),GO,^%VZEAVT($$^%QZCHW("")) G ACTD
 
GO C %PORT O %PORT
 N %9T,%9O,%DESSIN,%9X,%9Y,%9X1,%9Y1,%9X2,%9Y2
 S %DESSIN=1
 S %FONC="INIT" D ^%PBPZ
 S %FONC="INIT.DESSIN" D ^%PBPZ
 S %FONC="CLEAR" D ^%PBPZ
 S %FONC="CADRE" D ^%PBPZ
 S %FONC=DESSIN D ^%PBPZ
 S %FONC="PRINTER" D ^%PBPZ
 C %PORT Q
 
 
 
 
INIT 
 N %L,CPT,CH,CH2,GLO,L,MAX,VAL
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLO") K @(GLO)
 K @(HISTO)
 
 S CPT=""
 F %L=1:1 S CPT=$O(@GL@(CPT)) Q:CPT=""  D TRI
 S (MAX,CPT)=0,CH=""
 F %L=1:1 S CH=$ZP(@GLO@(CH)) Q:CH=""  S L="" D INS
 S @HISTO=CPT,@HISTO@("MAX")=MAX
 S @HISTO@("TEXTE")=2
 K @(GLO)
 S LARG=6
 Q
TRI 
 S CH=@GL@(CPT),L=$ZP(@GLO@(CH,""))+1
 S VAL=@GL@(CPT,"TEXT")
 S @GLO@(CH,L)=VAL
 Q
 
INS S L=$O(@GLO@(CH,L)) Q:L=""
 S VAL=@GLO@(CH,L)
 S CH2=(CH/@GL)*100,CPT=CPT+1
 S @HISTO@(CPT)=CH2,@HISTO@(CPT,"TEXT")=VAL
 S:CH2>MAX MAX=CH2
 G INS
 
AFF 
 D ^%VZCDB($$^%QZCHW("MIX sur")_" "_$S(TYP="C":$$^%QZCHW("le carnet de commande"),1:$$^%QZCHW("l'etude")_" "_ETU),0)
 S DX=XG,DY=(YH+DV)-2 X XY D BLD^%VVIDEO X XY W ATR
 S DX=XG,DY=DY+1 X XY D BLD^%VVIDEO X XY W "Pourcentage"
 D NORM^%VVIDEO Q
 
IMP(T) 
 I T="G" G IMPG
 
 S DX=25,DY=YH-1 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("MIX sur")_" "_$S(TYP="C":$$^%QZCHW("le carnet de commande"),1:$$^%QZCHW("l'etude")_" "_ETU)
 S DX=0,DY=(DV+YH)-2 X XY S ^IMP($J,$Y,$X)=$E(ATR,1,LMARG-1)
 S DY=DY+1 X XY S ^IMP($J,$Y,$X)=$$^%QZCHW("Pourcentage")
 Q
IMPG 
 S @TXT@(YH+1,(XC+LMARG)+20)=$$^%QZCHW("MIX sur")_" "_$S(TYP="C":$$^%QZCHW("le carnet de commande"),1:$$^%QZCHW("l'etude")_" "_ETU)
 S DY=(HFHA+HHIST)+3,@TXT@(DY,XC)=$E(ATR,1,LMARG)
 S DY=DY+1,@TXT@(DY,XC)=$$^%QZCHW("Pourcentage")
 Q

