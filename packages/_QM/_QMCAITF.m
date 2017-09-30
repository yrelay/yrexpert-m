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
;! Nomprog     : %QMCAITF                                                     !
;! Module      : CONSULTATION ASSOCIATIVE                                     !
;! But         : Menu                                                         !
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

%QMCAITF ;
 
 
 
 
 
 N %R,NUML,VAL,TEMP,MEN,IMPR,REP,LISTREP,LISTR,NUMS,GL,GLIST,GLOBAL,AA,ADR,CTR,CONTR,NL,FEN,STOP,ORD,SAA,ADRES
 D INIT
 ;HL2 AFF D REAFF
ACT 
AFF D REAFF
 S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,MEN,.ADR,.CTR) G:CTR="R" AFF G:(CTR="A")!(CTR="F") FIN
 S DX=0,DY=22 D CLEBAS^%VVIDEO
 G:ADR'="" @ADR G ACT
 
FIN 
 D POCLEPA^%VVIDEO
 S SAA=$$MES^%VZEOUI($$^%QZCHW("Voulez-vous conserver la session courante")_" ? ","N")
 I SAA=1 D GLOCOP^%QCAGLC(GLOBAL,$$CONCAS^%QZCHAD(ADRES,"SAISIE"))
 I SAA=0 K @(ADRES)
 F FEN="CASAISIE","CAREP","CALISTE","CADETAIL" D TUER^%TLBAGF1(FEN)
 K @(TEMP)
 Q
 
NET 
 ;HL2 S DX=0,DY=23 X XY
 S DX=0,DY=23 X XY D CLEBAS^%VVIDEO
 G:$$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous vraiment nettoyer la session courante")_" ? ")'=1 ACT
 F FEN="CASAISIE","CAREP","CALISTE","CADETAIL" D INIT^%TLBAGF3(FEN)
 K @(ADRES) S NUMS=0,NUML=2
 G AFF
 
REC 
 S AA=$$CHOI("CASAISIE",1,"Pour reconsulter, selectionner une question par [RETURN]") G:AA="" ACT
 S AA=$P(@GLOBAL@(AA),") ")-1
 D REAF^%TLBAGF1("CAREP",(AA*6)+1),REAF^%TLBAGF1("CALISTE",(AA*9)+1)
 
 G REC
 
LOCAL 
 S AA=$$CHOI("CAREP",0,"") G ACT
 
INDIV 
 D DEB^%QMCAFF("CALISTE") G ACT
 
IMP 
 S DX=0,DY=23 X XY D CLEBAS^%VVIDEO ;HL2
 D IMP^%QMCARES G ACT
 
 
PRES D ^%QSMOVIS
 G AFF
 
BROS 
 D ^%QSGBASE
 G AFF
 
ACCES 
AC S AA=$$CHOI("CASAISIE",1,"Pour voir toutes les reponses, selectionner une question par [RETURN]") G:AA="" ACT
 S C=$$CONCAT^%QZCHAD(GLIST,$$S1^%QZCHAD($P(@GLOBAL@(AA),")"))_",""DEB""")
 I '($D(@C)) D ^%VZEAVT($$^%QZCHW("Pas de reponse")) G AC
 D CLEPAG^%VVIDEO,REAF2^%TLBAGF1("CADETAIL",@C,"")
 S DX=5,DY=0,SAA=$P(@GLOBAL@(AA),") ",2) D AFF^%QMCAFF("Pour la consultation de :   "_SAA_"   voici...")
 D DEB^%QMCAFF("CADETAIL"),REAFF G AC
 
 
 
CHOI(FEN,%R,MSG) 
 I MSG'="" D POCLEPA^%VVIDEO W $$^%QZCHW(MSG)
 S AA=$$CHOIX^%TLBAGF2(FEN,%R,0)
 I AA="" D REAF^%TLBAGF1(FEN,0)
 Q AA
 
INIT 
 D MSG^%VZEATT($$^%QZCHW("Initialisations en cours"))
 S ADRES=$$ADR
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 D CREER^%TLBAGF1("CASAISIE",0,3,(SL\2)-4,RM\2,RM,0,"",1,$$BLD^%VVIDEO1_$$^%QZCHW("Informations sur ?")_$$NORM^%VVIDEO1)
 D CREER^%TLBAGF1("CAREP",RM\2,3,(SL\2)-4,(RM\2)-1,RM,0,$$CONCAS^%QZCHAD(ADRES,"TEREP"),1,$$BLD^%VVIDEO1_$$^%QZCHW("localisation dans schema")_$$NORM^%VVIDEO1)
 D CREER^%TLBAGF1("CALISTE",0,(SL\2)-1,(SL\2)-1,RM-1,RM,0,$$CONCAS^%QZCHAD(ADRES,"TELISTE"),1,$$BLD^%VVIDEO1_$$^%QZCHW("details des premieres reponses")_$$NORM^%VVIDEO1)
 D CREER^%TLBAGF1("CADETAIL",0,1,SL-2,RM-1,RM,0,$$CONCAS^%QZCHAD(ADRES,"DETAIL"),1,$$BLD^%VVIDEO1_"..."_$$^%QZCHW("toutes les reponses")_$$NORM^%VVIDEO1)
 
 S GLOBAL=$$GLOB^%TLBAGF1("CASAISIE")
 D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD(ADRES,"SAISIE"),GLOBAL)
 S GLIST=$$CONCAS^%QZCHAD(ADRES,"GLOLIST")
 
 S LISTREP=$$CONCAS^%QZCHAD(TEMP,"LISREP")
 S LISTR=$$CONCAS^%QZCHAD(TEMP,"LISR")
 D REPI^%QSGEST9(LISTREP) K @LISTREP@("%")
 
 I $D(@LISTREP@("ATTRIBUT")) K @LISTREP@("ATTRIBUT")
 
 N RL S REP=""
 F %R=0:1 S REP=$O(@LISTREP@(REP)) Q:REP=""  S RL=@LISTREP@(REP) S:('($$RESERVE^%QSMODE3(RL)))!(RL="LIEN") @LISTR@(REP)=RL I ($$REPM^%QSGEST9(RL)'=2)&(REP'="%"),RL'="LIEN" K @LISTREP@(REP)
 
 S MEN=$$CONCAS^%QZCHAD(TEMP,"MENU")
 S @MEN="21^10^79"
 S @MEN@(1)=$$^%QZCHW("consultation")_"^CONS0^%QMCARES",@MEN@(1,"COM")=$$^%QZCHW("Recherche de valeurs")
 S @MEN@(2)=$$^%QZCHW("consultation.etendue")_"^CONS1^%QMCARES",@MEN@(2,"COM")=$$^%QZCHW("Recherche de valeurs (y compris dans les indices des attributs)")
 S @MEN@(3)=$$^%QZCHW("reconsulter")_"^REC",@MEN@(3,"COM")=$$^%QZCHW("Reconsulter en choisissant une ancienne valeur")
 S @MEN@(4)=$$^%QZCHW("localisation")_"^LOCAL",@MEN@(4,"COM")=$$^%QZCHW("Localisation des reponses dans le schema de donnees")
 S @MEN@(5)=$$^%QZCHW("details")_"^INDIV",@MEN@(5,"COM")=$$^%QZCHW("Acces aux details des renseignements trouves")
 S @MEN@(6)=$$^%QZCHW("toutes.reponses")_"^ACCES",@MEN@(6,"COM")=$$^%QZCHW("Acces a toutes les reponses")
 S @MEN@(7)=$$^%QZCHW("schema")_"^PRES",@MEN@(7,"COM")=$$^%QZCHW("Presentation generale du schema ( Help )")
 S @MEN@(8)=$$^%QZCHW("impression")_"^IMP",@MEN@(8,"COM")=$$^%QZCHW("Sortie sur imprimante des reponses")
 S @MEN@(9)=$$^%QZCHW("compulser")_"^BROS",@MEN@(9,"COM")=$$^%QZCHW("Parcours de la base par proximite")
 S @MEN@(10)=$$^%QZCHW("nettoyage")_"^NET",@MEN@(10,"COM")=$$^%QZCHW("Nettoyer la session courante")
 S IMPR=$$CONCAS^%QZCHAD(ADRES,"IMPRESSION"),@IMPR@(1)=" "
 S NUML=$ZP(@IMPR@(""))+1,NUMS=$ZP(@GLOBAL@("")),AA=1
 Q
 
REAFF 
 D CLEPAG^%VVIDEO,^%VZCD(0,39,0,2,1,0,"CONSULTATION ASSOCIATIVE sur "_WHOIS)
 F FEN="CASAISIE","CAREP","CALISTE" D REAF^%TLBAGF1(FEN,0)
 Q
 
ADR() 
 S SAA=$S($$ADR^%QZNBN1($I):$I,1:""""_$I_"""")
 Q "^[QUI]RQSGLO(""QMCA"","_SAA_")"

