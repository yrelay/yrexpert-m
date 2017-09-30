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

;%TXCONS^INT^1^59547,74031^0
%TXCONS ;
 
 
 
 
 N DAAT,HEU,NAME,NAIS,HINIT,HX,MX,CH,OBJ,COM,PRE,CR,TEMP,ADD,DOS,MEN1
 S TEMP=$$CONCAS^%QZCHAD("^TEMPORAI",$J_","_$P($ZPOS,"^",2)) K @(TEMP)
 D HRV^%TXINDH,CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Consultation des dossiers"),0)
DEB S DX=5,DY=3 D CLEBAS^%VVIDEO
 X XY W $$^%QZCHW("Date")," : ",TAD
 X XY S DAAT=$$^%VZAME1($$^%QZCHW("Date")_" :") Q:CTRLA!CTRLF
 I DAAT="" S DAAT=TAD G HEU
 S DAAT=$$CORRECT^%VYDAT(DAAT) G:DAAT="" DEB
 S DX=12 X XY W DAAT
HEU S DX=5,DY=5 X XY S Y1=$$^%VZAME1($$^%QZCHW("Heure du premier rendez-vous")_" : ") G:CTRLA!CTRLF DEB
 I Y1="" S HINIT="" G CONS
 S HX=$P(Y1,"H",1),MX=$P(Y1,"H",2),MX=$S((MX="00")!(MX="0"):"",1:MX)
 I MX="" S HX=HX-1,HINIT=$S($L(HX)=1:"0"_HX_"H"_"59",1:HX_"H"_"59") G CONS
 S MX=MX-1 S:$L(MX)=1 MX="0"_MX
 S HINIT=$S($L(HX)=1:"0"_HX_"H"_MX,1:HX_"H"_MX)
 D MSG^%VZEATT
CONS 
 S HEU=HINIT
 D ^%TXCREO,CLEPAG^%VVIDEO
 S HEU=HINIT
LHEUR S HEU=$O(^[QUI]RDV(DAAT,HEU)) Q:HEU=""
 S NAME=""
LNAME S NAME=$O(^[QUI]RDV(DAAT,HEU,NAME)) G:NAME="" LHEUR
 S NAIS=""
LNAIS S NAIS=$O(^[QUI]RDV(DAAT,HEU,NAME,NAIS)) G:NAIS="" LNAME
 S COM=""
LCOM S COM=$O(^[QUI]RDV(DAAT,HEU,NAME,NAIS,COM)) G:COM="" LNAIS
 S CH=^[QUI]RDV(DAAT,HEU,NAME,NAIS,COM),PRE=$P(CH,"^",3),OBJ=$E(COM,1,5)
 G:$D(@TEMP@(DAAT,HEU,NAME,PRE,NAIS)) LCOM
AMBI I (PRE="?")!(NAIS="?") D ^%TXCLIS(.SER) G:SER=3 QUES G:SER=2 LCOM
 S DOS=$$VERIF^IFUCONT(NAME,PRE,NAIS) I DOS="" D INCON G QUES
 
SUIT S ADD=$$AFF
 G @ADD
 
QUES 
 D POCLEPA^%VVIDEO S CR=$$MES^%VZEOUI($$^%QZCHW("Voulez-vous creer le dossier")_" ? ","O") G:CR=-1 LCOM G:CR=0 78 G 79
78 D INIT S ADD=$$SUITE
 G @ADD
79 S NAMEP=NAME,NAISP=NAIS
 D ^IFDCRED S NAME=NAMEP
 D MAJ
 
VU S @TEMP@(DAAT,HEU,NAME,PRE,NAIS)=1,HEU=HINIT
 G LHEUR
 
INSER 
 S CONNU=0,TROUVE=0,CONNECT=1
 D CLEPAG^%VVIDEO,GNOM^%TXAJRV
 I ABENDSCR=1 S HEU=HINIT G LHEUR
 D POCLEPA^%VVIDEO
 S NAME=NOM
 S CR=$$MES^%VZEOUI($$^%QZCHW("Cette personne avait-elle rendez-vous aujourd'hui")_" ? ","N") G:CR=-1 FINS
 I CR=1 D PRES^%TXCREO G FINS
 S CR=$$VERIF^IFUCONT(NAME,PRE,NAIS) I CR'="" S CONNU=1
FINS S DX=0,DY=17 D CLEBAS^%VVIDEO
 G:TROUVE=1 AMBI G QUES
 
PRISRDV 
 D ^%TXRDVS S HEU=HINIT G LHEUR
 
FIN Q
INCON D ^%VZEAVT(NAME_" "_PRE_" "_$$^%QZCHW("ne(e) le")_" "_NAIS_" "_$$^%QZCHW("est inconnu(e)"))
 Q
 
MAJ 
 S $P(CH,"^",3)=PRE
 K ^[QUI]RDV(DAAT,HEU,NAME,NAISP,COM)
 S ^[QUI]RDV(DAAT,HEU,NAME,NAIS,COM)=CH
 Q
AFF() 
 N SCR,MEN,TEMP,ADR,CTR,INVI,ABENDSCR,ICC,MENU2,MENU3,ADRES,CONTR,INVI
 S CR=$$NOM^IFDCORM(DOS)
 I CR=0 S ADR="FIN" G END
 
 
 D INIT
 G ACTI
SUITE() 
ACTI 
 S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(10,80,22,MEN1,.ADR,.CTR)
 I CTR="F" S ADR="VU" G END
 I CTR="A" S ADR="FIN" G END
 G:ADR="" ACTI G END
 
END K @(TEMP)
 Q ADR
 
INIT 
 S MEN1=$$CONCAS^%QZCHAD(TEMP,"MEN1")
 S @MEN1@(1)=$$^%QZCHW("Rendez-vous")_"^PRISRDV"
 S @MEN1@(1,"COM")=$$^%QZCHW("Acces a la grille des rendez-vous")
 S @MEN1@(2)=$$^%QZCHW("Inserer")_"^INSER"
 S @MEN1@(2,"COM")=$$^%QZCHW("Insertion de rendez-vous")
 S @MEN1@(3)=$$^%QZCHW("Suivant")_"^LCOM"
 S @MEN1@(3,"COM")=$$^%QZCHW("Rendez-vous suivant")
 Q

