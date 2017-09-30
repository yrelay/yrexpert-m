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

;%LNKACT^INT^1^59547,73870^0
LNKACT ;
 
 
 
 
 
 
 
 N GL,LISTE,NOML,REP,REPE,RES,TEMP,TITRE,DATE,OX,OY S OX=1,OY=8
 N MODAF,MN,CONTR,ADR,ETU,CTR,L,GLMA,LL,LL2,LL3,COMPO,OB,ETUTOT
 N CTR,AD,MEN,TEMP
 
 S ^KLNTOT($J)=""
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S SCX=$$CONCAS^%QZCHAD(TEMP,"PARAMETRES")
 S COMPO=$$CONCAS^%QZCHAD(TEMP,"COMPOSANTS")
DEB S TITRE=$$^%QZCHW("Activation d'une etude")
 D TIT
 S DX=10,DY=5 X XY D LIRE2^%VREAD($$^%QZCHW("Etude")_" : ","",9,RM-1,DY+1,DY-1,"TIT^%LNKACT","$$UC^%LNKETU",.CTR,.ETU)
 S DEJAF=0,LL2="",LL="",LL3=""
 I (CTR'="")!(ETU="") G FIN
 
 S MN=$$CONCAS^%QZCHAD(TEMP,"MENU")
 S RES=$$CONCAS^%QZCHAD(TEMP,"RES")
 D MENU^%LNKACT2(MN)
 S REPE=$$REP^%LNKETU
INIT S MODAF=0 D LOAD
 I LIND'="",$$ADRLIS^%QSGEST7(LIND)="" D ^%VZEAVT($$^%QZCHW("La liste des individus")_" "_LIND_" "_$$^%QZCHW("n'existe plus")) G DEB
AFF 
 D ENTETE
ACT D EFFBAS,^%VQUIKMN(1,79,22,MN,.AD,.CONTR)
 I CONTR="R" G INIT
 I (CONTR="A")!(CONTR="F") D EFFBAS,^%VZEATT,CLOSE^%LNKACT2,KILL(LL2),KILL(LL) G DEB
 G:AD="" ACT G @AD
FIN D CLOSE^%LNKACT2
 D KILL(LL)
 K @(TEMP),^KLNTOT($J)
 Q
 
TIT D CLEPAG^%VVIDEO,^%VZCDB(TITRE,0)
 Q
LOAD 
 S REPS=$$^%QSCALVA($$REP^%LNKETU,ETU,"REPERTOIRE")
 S IND=$$^%QSCALVA($$REP^%LNKETU,ETU,"INDIVIDU")
 S LIND=$$^%QSCALVA($$REP^%LNKETU,ETU,"LISTE.INDIVIDU")
 S LIEN=$$^%QSCALVA($$REP^%LNKETU,ETU,"LIEN.NOMENCLATURE")
 S POCHE=$$^%QSCALVA($$REP^%LNKETU,ETU,"POCHE")
 S NOMENC=$$^%QSCALVA($$REP^%LNKETU,ETU,"TRANSFERT.NOMENCLATURE")
 S ECH1=$$^%QSCALVA($$REP^%LNKETU,ETU,"LISTE.ECHANGE.1")
 S ECH2=$$^%QSCALVA($$REP^%LNKETU,ETU,"LISTE.ECHANGE.2")
 Q
ENTETE D TIT,BLD^%VVIDEO
 S DX=30,DY=1 X XY W $$^%QZCHW("etude")_" : "_ETU D NORM^%VVIDEO
 S DX=2,DY=DY+1 X XY W $$^%QZCHW("repertoire")_" : ",REPS
 S DX=40 X XY W $$^%QZCHW("lien nomenclature")_" : ",LIEN
 S DX=2,DY=DY+1 X XY W $$^%QZCHW("individu  ")_" : ",IND
 S DX=40 X XY W $$^%QZCHW("liste d'individus")_" : ",LIND
 S DX=2,DY=DY+2 X XY W $$^%QZCHW("poche de sf")_" : ",POCHE
 S DX=40 X XY W $$^%QZCHW("1ere liste d'echange")_" : ",ECH1
 S DX=2,DY=DY+1 X XY W $$^%QZCHW("transfert nomenclature")_" : ",NOMENC
 S DX=40 X XY W $$^%QZCHW("2eme liste d'echange")_" : ",ECH2
 D CADRL
 I LIND'="" S LL=LIND G ENT0
 I LL'="" G ENT0
 S LL=$$GEN^%QCAPOP("TMP")
 D ^%VZEATT,^%QSGES11($$NOMINT^%QSF(REPS),LL,"TMP",0,"CONFIGURATEUR","")
 D STOCK^%QSGES11(LL,IND)
ENT0 I DEJAF D USE^%QUAPAGM("INDIVIDU"),AFFICH^%QUAPAGM Q
 D AFFRES^%LNKACT2(LL,0,DEJAF)
 S DEJAF=1
 Q
 
ETU 
 D EFFBAS,MOD(ETU)
 G AFF
IND 
 D EFFBAS,AFFRES^%LNKACT2(LL,1,DEJAF)
 G ACT
IDT 
 D SEL^%LNKACT2(LL,.LL2)
 I '($$VERIF(LL2,.MSG)) D:MSG'="" ^%VZEAVT(MSG) G ACT
 D NETIDT^%LNKACT2(LL2,REPS,POCHE,.OK) I '(OK) D ^%VZEAVT($$^%QZCHW("probleme(s) sur la liste"))
 D IDT^%LNKACT3(LL2)
 D MAJIDT^%LNKACT2(LL2,REPS,"IDENTIFIE")
 G AFF
CNF 
 D SEL^%LNKACT2(LL,.LL2)
 S MSG=$$UC^%LNKACT3(ETU,LL2) I MSG'="" D ^%VZEAVT(MSG) G ACT
 D CNF^%LNKACT3(LL2,ECH1)
 D MAJIDT^%LNKACT2(LL2,REPS,"CONFIGURE")
 G AFF
RST 
 D EFFBAS,USE^%QUAPAGM("INDIVIDU")
 S OB=$$UN^%QUAPAGM
 G:OB="" ACT
 S ETUTOT=$$^%QSCALVA($$NOMINT^%QSF(REPS),OB,"ETUDE.TOTEM")
 I ETUTOT="" K ETUTOT G ACT
 D VISU^TOXXVERI(ETUTOT)
 K ETUTOT
 G AFF
TRSF 
 D SEL^%LNKACT2(LL,.LL2)
 S MSG=$$UCT^%LNKACT3(ETU,LL2) I MSG'="" D ^%VZEAVT(MSG) G ACT
 D TRSF^%LNKACT3(LL2,ECH2,NOMENC)
 D MAJIDT^%LNKACT2(LL2,REPS,"TRANSFERE")
 D LOAD
 G AFF
VISU 
 D EFFBAS,USE^%QUAPAGM("INDIVIDU")
 S OB=$$UN^%QUAPAGM
 G:OB="" ACT
 K @(COMPO)
 D ^%QMNF4($$NOMINT^%QSF(REPS),OB,LIEN,COMPO,.PROFMX)
 D ^%QMNF5(COMPO,$$NOMINT^%QSF(REPS),OB,LIEN,PROFMX)
 K @(COMPO)
 G AFF
DEL 
 D SEL^%LNKACT2(LL,.LL3)
 D POCLEPA^%VVIDEO S I=$$CONFIRM^%VZEOUI($$^%QZCHW("confirmation")_" : ")
 I I=-1 G ACT
 I I=0 G ACT
 D DEL^%LNKACT3(ETU,LL3)
 G AFF
ATT 
 S I=$$^%QS0MEN2
 G ACT
ACTIV 
 G ACT
 
MOD(ETU) 
 N RESUL,PATOUCH,ABENDSCR,CMS,OR,AFRESU,SCR
 S RESUL(1)=ETU,SCR="LNKETU",(ABENDSCR,CMS)=0
 D LOAD^%LNKETU2(ETU,.RESUL),^%VAFIGRI,^%VAFISCR
 D MOD^%LNKETU(.RESUL),LOAD
 S DEJAF=0,LL2="" D KILL(LL) S LL=""
 Q
CADRL D CARSP^%VVIDEO(OX,OY,21-OY,78,1) Q
EFFBAS S DX=0,DY=21 D CLEBAS^%VVIDEO Q
KILL(LL) 
 Q:LL=""
 Q:LL=LIND
 D DEL^%QSGES11($$^%QSCALVA("L0",LL,"LISTE.ERREURS"))
 D DEL^%QSGES11(LL) Q
 
VERIF(LL2,MSG) 
 S MSG=""
 Q:LL2="" 0
 
 I $$CARD^%QSGEST7(LL2)=0 S MSG=$$^%QZCHW("liste vide") Q 0
 
 N ADRL,OB,BASE,REFUSE,I
 S ADRL=$$ADRLIS^%QSGEST7(LL2)
 I ADRL="" S MSG=$$^%QZCHW("impossible de trouver les individus de la liste") Q 0
 S BASE=$$BASE^%QSGEST7(LL2)
 I BASE="" S MSG=$$^%QZCHW("impossible de trouver le repertoire de la liste") Q 0
 S OB="",REFUSE=0
 F I=1:1 S OB=$O(@ADRL@(OB)) Q:OB=""  I '($$IR^%QSGE5(BASE,OB)) S REFUSE=1 Q
 I REFUSE S MSG=$$^%QZCHW("individu inconnu")_" : "_OB Q 0
 Q 1

