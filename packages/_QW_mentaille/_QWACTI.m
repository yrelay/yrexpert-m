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

;%QWACTI^INT^1^59547,73886^0
%QWACTI ;
 
 
 
 
 N TEMP,CTR,NOMETUDE,LSV,LIN
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"QW") K @(TEMP)
 S LSV=$$CONCAS^%QZCHAD(TEMP,"LR"),LIN=$$CONCAS^%QZCHAD(TEMP,"LI")
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Etudes MENTAILLE"),0)
 D TIT
 S DX=10,DY=5 X XY D LIRE2^%VREAD($$^%QZCHW("Etude")_" : ","",9,RM-1,DY+1,DY-1,"TIT^%QWACTI","$$UC^%QWETUD2",.CTR,.NOMETUDE) I (CTR'="")!(NOMETUDE="") K @(TEMP) Q
 D TIT S DX=10,DY=5 X XY W $$^%QZCHW("Etude")_" : "_NOMETUDE
 S DX=10,DY=8 X XY D LIRE2^%VREAD($$^%QZCHW("Mode visible")_" : ","OUI",9,70,8,8,"TIT^%QWACTI","$$UCVIS^%QWEXEC",.CTR,.VISI) I CTR'="" K @(TEMP) Q
 S CTR=$$ACTIV(NOMETUDE,"OUI",LIN,LSV)
 Q
 
 
TIT D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Activation d'une etude MENTAILLE"),0) Q
 
 
 
AUTO(NOMETUDE,LLIS) 
 N TEMP,LSV,RES,LIS
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"AU") K @(TEMP)
 S LSV=$$CONCAS^%QZCHAD(TEMP,"L")
 S LIS=$$CONCAS^%QZCHAD(TEMP,"LI")
 S RES=0
 D MKLIS(LLIS,LIS)
AUTO2 S RES=$$ACTIV(NOMETUDE,"OUI",LIS,LSV)
 G:RES=0 AUTOF
 S RES=$O(@LSV@(""))
AUTOF K @(TEMP) Q RES
 
 
MKLIS(NLL,GLOL) 
 N ADRL,IL,%IL,NIML,ADRI,JL,%JL,REP,NOML
 I '($$IR^%QSGE5("L0",NLL)) Q
 S ADRL=$$ADRLT^%QSGEST7(NLL) G:ADRL="" MK2
 S IL="" F %IL=0:0 S IL=$O(@ADRLT@(IL)) Q:IL=""  S NOML=@ADRLT@(IL) D MKLI2
 Q
MK2 S ADRL=$$ADRLIS^%QSGEST7(NLL) Q:ADRL=""
 S NOML="" F %IL=0:0 S NOML=$O(@ADRL@(NOML)) Q:NOML=""  D MKLI2
 Q
MKLI2 I '($$IR^%QSGE5("L0",NOML)) Q
 S REP=$$^%QSCALIN("L0",NOML,"BASE",1) Q:REP=""
 S ADRI=$$ADRLT^%QSGEST7(NOML) G:ADRI="" MKLI3
 S JL="" F %JL=0:0 S JL=$O(@ADRI@(JL)) Q:JL=""  S @GLOL@(REP,@ADRI@(JL))=""
 Q
MKLI3 S ADRI=$$ADRLIS^%QSGEST7(NOML) Q:ADRI=""
 S JL="" F %JL=0:0 S JL=$O(@ADRI@(JL)) Q:JL=""  S @GLOL@(REP,JL)=""
 Q
 
GETNUM(NUM) N NUM2
 S NUM2=NOMETUDE_$S(NUM>99:".",NUM>9:".0",1:".00")_NUM
 Q NUM2
 
 
ACTIV(NOMETUDE,VISI,LINDSUP,LSVGDE) 
 N ISVGDE,IETUDE,GLOSAVE,OSVG,I
 N TEMP
 
 N MNITP,MNITC,MNGEN
 
 N WWSTOCK,WWLSTOCK,WWINIT,WWHIST,WWSTEP,WWORDAT,WWSEL,WWBUT
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N WWAFF,REFUSMNP
 
 N ADR,CTR,AD,CONT
 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Etudes MENTAILLE"),0)
 D MSG^%VZEATT($$^%QZCHW("Initialisations"))
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"AC") K @(TEMP)
 
 S MNITP=$$CONCAS^%QZCHAD(TEMP,"MNITP"),MNITC=$$CONCAS^%QZCHAD(TEMP,"MNITC"),MNGEN=$$CONCAS^%QZCHAD(TEMP,"MNGEN")
 
 S RSAC=$$CONCAS^%QZCHAD(TEMP,"RSAC")
 
 S WWSTOCK=$$CONCAS^%QZCHAD(TEMP,"SK")
 S WWHIST=$$CONCAS^%QZCHAD(TEMP,"HI")
 S WWSTEP=$$CONCAS^%QZCHAD(TEMP,"ST")
 S WWORDAT=$$CONCAS^%QZCHAD(TEMP,"OR")
 S WWAFF=$$CONCAS^%QZCHAD(TEMP,"AF")
 S WWSEL=$$CONCAS^%QZCHAD(TEMP,"SL")
 S WWBUT=$$CONCAS^%QZCHAD(TEMP,"BU")
 
 
 D ^%QWMENU
 
 D TIT
 
 S ADR="^[QUI]RQSGLO(""QW"",""ET"")"
 S IETUDE=@ADR@(NOMETUDE)
 S GLOSAVE=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""QW"",""SVG"")",IETUDE)
 S WWINIT=$$CONCAT^%QZCHAD(ADR,""""_NOMETUDE_""",""I""")
 S WWLSTOCK=$$CONCAT^%QZCHAD(ADR,""""_NOMETUDE_""",""L""")
 K @(WWSTOCK),@(WWHIST),@(WWSTEP),@(WWORDAT),@(WWSEL)
 D INITEX
 D AJIND
 I '($D(@GLOSAVE)#10) S @GLOSAVE=0
 S (OSVG,ISVGDE)=@GLOSAVE
 S CONT=^[QUI]RQSGLO("QW","ETUDE",NOMETUDE)
 D ^%VZEATT,INIT^%QWAFFI
 D EXEC^%QWAC($P(CONT,"^",5),VISI="OUI",$S($P(CONT,"^",2)="ENSEMBLE.ATTRIBUTS":1,1:0),1)
 S ^[QUI]RQSGLO("QW","ET",NOMETUDE,"ETAT")="ACTIVEE"
 F I=OSVG+1:1:ISVGDE S @LSVGDE@($$GETNUM(I))=""
 S @LSVGDE=ISVGDE-OSVG,@GLOSAVE=ISVGDE
 K @(TEMP)
 Q ISVGDE-OSVG
 
 
 
INITEX N R,I,A,O,V
 D MSG^%VZEATT($$^%QZCHW("Recuperation des donnees"))
 S R=""
IN1 S R=$O(@WWINIT@(R)) G:R="" BUT S I=""
IN2 S I=$O(@WWINIT@(R,I)) G:I="" IN1 S A=""
IN3 S A=$O(@WWINIT@(R,I,A)) G:A="" IN2 S O=""
IN4 S O=$O(@WWINIT@(R,I,A,O)) G:O="" IN3
 S V=@WWINIT@(R,I,A,O)
 S (@WWSTOCK@(R,I,A,O),@WWORDAT@(R,I,A,O,0),@WWSTEP@(0,"P",R,I,A,O))=V
 G IN4
 
BUT 
 
 S ADR="^[QUI]RQSDON(""QW"",""BUT"")"
 S I="",O=1
BU1 S I=$O(@ADR@(NOMETUDE,I)) I I="" G CONTR
 F R=1:1 Q:'($D(@ADR@(NOMETUDE,I,R)))  S @WWBUT@(O,"E")=@ADR@(NOMETUDE,I,R,"E"),O=O+1
 G BU1
 
CONTR S ADR="^[QUI]RQSDON(""QW"",""CONTR"")",I=""
CO2 S I=$O(@ADR@(NOMETUDE,I)) G:I="" FBUT F R=1:1 Q:'($D(@ADR@(NOMETUDE,I,R)))  S @WWBUT@(O,"E")=@ADR@(NOMETUDE,I,R,"E"),O=O+1
 G CO2
FBUT 
 S @WWBUT=O-1
 D POCLEPA^%VVIDEO
 Q
 
 
AJIND N R,I,A,O,V,LVAL
 S LVAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"AJ") K @(LVAL)
 S R=""
AJ1 S R=$O(@LINDSUP@(R)) I R="" K @(LVAL) Q
 S I=""
AJ2 S I=$O(@LINDSUP@(R,I)) G:I="" AJ1 S A=""
AJ3 S A=$$NXTRIA^%QSTRUC8(R,I,A) G:A="" AJ2
 I $$TYPEL^%QSGES90(A)'=0 G AJ3
 K @(LVAL) D MVG^%QSCALVA(R,I,A,LVAL) S O=""
AJ4 S O=$O(@LVAL@(O)) G:O="" AJ3
 S V=@LVAL@(O),(@WWSTOCK@(R,I,A,O),@WWORDAT@(R,I,A,O,0),@WWSTEP@(0,"P",R,I,A,O))=V G AJ4
 ;

