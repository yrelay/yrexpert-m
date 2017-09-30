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

;%QMCAFF^INT^1^59547,73876^0
QMCAFF(FEN) 
 
 
 
 
 
 
 D REAF^%TLBAGF1(FEN,0)
GO N %C,%R,GLO,BA,BAL,IND,CL,CL1,ATR,C,NB,HA,GL
 S HA=$$HAUT^%TLBAGF1(FEN)-2,AAA=AA
BCL S AA=$$CHOIX^%TLBAGF2(FEN,1,AAA) Q:AA=""
 
 S GLO=$$GLOB^%TLBAGF1(FEN),AAA=AA
 G:(FEN="CALISTE")&((AA#HA)=0) DET
 
 S B=(AA-((AA\HA)*HA))#4 G:B=0 BCL
 S CL=@GLO@(AA),CL1=@GLO@(AA+1)
 I CL["repertoire" D REP G FIN
 G:B=3 BCL
 I CL["individu" D IND G FIN
 I CL["attribut" D ATR G FIN
 G BCL
 
FIN 
 I FEN="CALISTE" D REAFF^%QMCAITF G BCL
 D CLEPAG^%VVIDEO,REAF^%TLBAGF1("CADETAIL",0)
 S DX=5,DY=0 D AFF("Pour la consultation de :   "_SAA_"   voici...")
 G BCL
 
REP 
 N CPT
 S:B=1 REP=$P(CL," est",1) S:(B=2)!(B=3) REP=$P(CL," ",4)
 S BA=$$NOMINT^%QSF(REP),NB=$$CARD^%QSGEST5(BA)
 D CLEPAG^%VVIDEO,^%VZCDB("Repertoire "_REP_" ("_NB_$$^%QZCHW(" individus")_")",0)
 S DY=2
 I ('($D(@LISTR@(BA))))!(REP="LIEN") S DX=20 X XY D BLK^%VVIDEO W $$^%QZCHW("REPERTOIRE RESERVE AU SYSTEME") S DY=DY+1 D NORM^%VVIDEO
 
 S GL="^[QUI]RQSLIEN("""_BA_""")",DY=DY+1,DX=10
 I '($D(@GL)) D AFF("Ce repertoire n'est lie a aucun autre") S DY=DY+1 G REPI
 
 D AFF("Il est lie aux repertoires suivants (-->) via les liens indiques :")
 S C="",%R=0
 
 F %C=1:1 S C=$O(@GL@(C)) Q:(%R=5)!(C="")  S BA=$P(@GL@(C),"^",2),BAL=$$NOMLOG^%QSF(BA) I $$REPM^%QSGEST9(BAL)=2 D AFR
 S DY=DY+1 I C'="" S DX=20 D AFF(" etc ...") S DY=DY+1
 
REPI 
 S DY=DY+1,DX=10 G:NB=0 AP
 D AFF("Il contient "_$S(NB<6:"",1:"par exemple ")_"les individus"_" : ")
 S GL=$$LISTIND^%QSGEST6($$NOMINT^%QSF(REP)),C="",NB=$S(NB<5:1,1:NB\5),DX=15,CPT=0
 F %R=NB:1 S C=$O(@GL@(C)) Q:C=""  I (%R#NB)=0 S DY=DY+1 X XY W C S CPT=CPT+1 Q:CPT=5
 S DY=DY+1 I C'="" D AFF(" etc ...") S DY=DY+1
 
AP 
 S DY=DY+1,C="",GL="^[QUI]RQSATPR(REP,""*"",""*"",""*"")"
 I '($D(@GL)) S DX=10 D AFF("Il n'existe aucun attribut predefini") G FR
 S DX=10 D AFF("Attributs predefinis pour tous les individus")
 S DY=DY+1,DX=5,%R=0
 F %C=0:0 S C=$O(@GL@(C)) Q:(%R=1)!(C="")  S L=@GL@(C) F NB=1:2:15 S ATR=$P(L,"^",NB) I ATR'="" S ATR=$P(ATR," (") D AT Q:%R=1
 G FR
AT I ((DX+$L(ATR))+2)>79 S DY=DY+1,DX=5 I DY=22 X XY W "..." S %R=1 Q
 X XY W ATR,"," S DX=(DX+$L(ATR))+2
 Q
AFR S DX=0,DY=DY+1 X XY W "--> ",BAL S DX=27 X XY W "via ",C
 S DX=60,I=$P(@GL@(C),"^",1) X XY W "(",$S((I=2)!(I=1):"hierarchique",I=3:"relationnel",1:"involutif"),")"
 S %R=%R+1
 Q
 
FR D ^%VZEAVT("") Q
 
IND 
 I B=1 S IND=$S(@GLO@(AA+2)["nom complet":$P(@GLO@(AA+2),"complet ",2),1:$P(CL," est",1))
 I B=2 S IND=$P(CL,"individu ",2)
 S REP=$S(CL1["repertoire":$P(CL1," ",4),1:"LIEN")
 S REP=$$NOMINT^%QSF(REP)
 I REP="RQS" N REQ,BASE,NOLV,NOLC,COM,VAR,CONT D INIT^%QS4(IND) G FR
 I REP="L0" D ^%QS0LECR(IND,"",0) Q
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("SYNONYMES DE")_" "_IND,0)
 N SYN
 S GL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GL") K @(GL)
 S C="" F %C=0:0 S C=$O(^[QUI]ZSYNONY(C)) Q:(C="")!(C="z")  S SYN=$O(^[QUI]ZSYNONY(C,IND,"")) I SYN'="" S @GL@(SYN_" ("_C_")")=""
 I '($D(@GL)) S DY=3,DX=10 D AFF("Cet individu ne possede aucun synonyme")
 I $D(@GL) D INIT^%QUCHOIP(GL,1,"",0,1,80,6),AFF^%QUCHOIP,END^%QUCHOIP
 D VISU^%QSATTRI(IND,REP,0,7,80,16)
 K @(GL) Q
 
ATR 
 I B=2 S ATR=$P(CL,"attribut ",2),REP=$P(CL1," ",4) G AS
 I (CL'["valeur")&(CL'["numero d'ordre") S ATR=$P(CL," est",1),REP=$P(CL1," ",4) G AS
 S ATR=$P(CL,"attribut ",2)
 I @GLO@(AA+2)["repertoire" S REP=$P(@GLO@(AA+2)," ",4) G AS
 
 S REP="LIEN"
AS D ^%VZEATT
 S BA=$$NOMINT^%QSF(REP),GL=$$LISTIND^%QSGEST6(BA),NB=0,C=""
 F %C=0:0 S C=$O(@GL@(C)) Q:C=""  I $$AIR^%QSGE5(BA,C,ATR) S NB=NB+1
 D CLEPAG^%VVIDEO
 I '($$EXIST^%LXSTOCK(ATR)) D ^%VZEAVT($$^%QZCHW("Cet attribut n'est pas declare au lexique")) G SA
 D AFF^%LXIQ(ATR)
SA S DX=0,DY=15 D CLEBAS^%VVIDEO
 S DX=2 X XY W $$^%QZCHW("Cet attribut existe pour")," ",NB," ",$$^%QZCHW("individus sur")," ",$$CARD^%QSGEST5(BA)," ",$$^%QZCHW("du repertoire")," ",REP
 S DY=DY+2,DX=5
 I CL["lien" D AFF("Il lie les individus "_REP_"(s) aux "_$P(CL1," ",8)_"(s) suivant(s)")
 I CL'["lien" D AFF("Il a "_$S(NB<6:"",1:"par exemple ")_"les valeurs : ")
 S C="",NB=$S(NB<5:1,1:NB\5),DX=10,IC=0
 F %R=NB:1 S C=$$NXTRAV^%QSTRUC8(BA,ATR,C) Q:C=""  I (%R#NB)=0 S DY=DY+1 X XY W $S($L(C)<66:C,1:$E(C,1,65)_"...") S IC=IC+1 Q:IC=5
 I (C'="")&(IC=5) S DY=DY+1 D AFF(" etc ...")
 
 G FR
 
DET 
 S CL=@GLO@(AA) G:CL'["Il y a" BCL
 S C=$$CONCAT^%QZCHAD(GLIST,$$S1^%QZCHAD(@GLIST@("PAGE",AA))_",""DEB""")
 D CLEPAG^%VVIDEO,REAF2^%TLBAGF1("CADETAIL",@C,"")
 S AA=$$CHOIX^%TLBAGF2("CADETAIL",0,0)
 G FIN
 
AFF(MSG) 
 X XY D BLD^%VVIDEO
 W $$^%QZCHW(MSG) D NORM^%VVIDEO
 Q
 
 
DEB(FEN) 
 G GO

