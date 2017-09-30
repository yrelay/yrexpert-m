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

;%SCOACT^INT^1^59547,73887^0
SCOACT ;
 
 
 
 
 
 
 
 N GL,LISTE,NOML,NOML2,REP,REPE,RES,TEMP,TITRE,DATE,TO
 N MODAF,MN,CONTR,ADR,ETU,CTR,L,GLMA,DEJAF,DEJAF2
 N REPSOUR,OBSOUR,ACCAD,ARPREM,IGNORE,OBLIG,CTR,AD,MEN,TEMP,LISCIBLE
 N LISRSOU,MES,LISRCIB,LISICIB,LISRES,SCX
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S SCX=$$CONCAS^%QZCHAD(TEMP,"PARAMETRES")
 S LISDOM=$$CONCAS^%QZCHAD(TEMP,"DOMAINES")
 S LISCIBLE=$$CONCAS^%QZCHAD(TEMP,"CIBLES")
 S LISRSOU=$$CONCAS^%QZCHAD(TEMP,"REP.SOURCE")
 S LISRCIB=$$CONCAS^%QZCHAD(TEMP,"REP.CIBLE")
 S LISICIB=$$CONCAS^%QZCHAD(TEMP,"IND.CIBLE")
DEB S TITRE=$$^%QZCHW("Activation d'une etude")
 D TIT
 S DX=10,DY=5 X XY D LIRE2^%VREAD($$^%QZCHW("Etude")_" : ","",9,RM-1,DY+1,DY-1,"TIT^%SCOACT","$$UC^%SCOETUD",.CTR,.ETU)
 I (CTR'="")!(ETU="") Q
 S (DEJAF,DEJAF2)=0 K LL
 S MN=$$CONCAS^%QZCHAD(TEMP,"MENU")
 S RES=$$CONCAS^%QZCHAD(TEMP,"RES")
 D MENU^%SCOACT2(MN)
 S REPE=$$REP^%SCOETUD
INIT S MODAF=0 D LOAD
AFF 
 D ENTETE
ACT D EFFBAS,^%VQUIKMN(1,79,23,MN,.ADR,.CONTR)
 G:CONTR="R" REAF
 G:(CONTR="A")!(CONTR="F") DEB
 G:ADR="" ACT G @ADR
FIN K @(TEMP)
 D CLOSE^%SCOACT2,FIN^%SCOACT3
 D KLIST(LL)
 Q
CMP D EFFBAS
 
 K @(LISRSOU),@(LISDOM),@(LISICIB),@(LISRCIB),@(SCX)
 S @LISDOM@(DOM)=""
 I $$IR^%QSGEST5($$NOMINT^%QSF(REPCIB),LCIB) S @LISCIBLE@(1)=LCIB_"^"_REPCIB G CMP0
 I $$EX^%QSGEST7(LCIB) S @LISCIBLE@(1)=LCIB_"^"_"LISTE" G CMP0
 D ^%VZEAVT("erreur : liste ou individu cible") G ACT
CMP0 S VISU=1
 
 S MES=""
 S MES=$$CONTPAR^%SCOACTR(REPSOUR,OBSOUR,ACCAD,ARPREM,VISU)
 I MES'="" D ^%VZEAVT($$^%QZCHW(MES)) G ACT
 
 S MES=$$CONTDOM^%SCOACTR(LISDOM,LISRSOU,LISRCIB,VISU)
 I MES'="" D ^%VZEAVT($$^%QZCHW(MES)) G ACT
 I '($D(@LISRSOU@(REPSOUR))) D ^%VZEAVT(REPSOUR_" "_$$^%QZCHW("n'est pas un repertoire reference")) G ACT
 
 S MES=$$CONTCIB^%SCOACTR(LISCIBLE,LISICIB,VISU)
 I MES'="" D ^%VZEAVT($$^%QZCHW(MES)) G ACT
 D EFFBAS S DX=0,DY=23 X XY S VISU=$$^%VZECH2($$^%QZCHW("Activation en mode "),"VISIBLE","INVISIBLE")
 S VISU=$S(VISU="INVISIBLE":0,VISU="VISIBLE":1,1:"")
 I VISU="" D POCLEPA^%VVIDEO G ACT
 S NOML=$$^%QSCALVA(REPE,ETU,"LISTE.COMPARABLES")
 D MSG^%VZEATT("suppression des derniers resultats")
 I NOML'="" D DEL^%QSGES11($$^%QSCALVA(REPE,ETU,"LISTE.COMPARABLES"))
 K ^[QUI]RQSGLO("SCX",ETU)
 D POCLEPA^%VVIDEO,MSG^%VZEATT($$^%QZCHW("Activation en cours ..."))
 S NOML=""
 
 S @SCX@("BASE.REFERENCE")=REPSOUR
 S @SCX@("OBJET.REFERENCE")=OBSOUR
 S @SCX@("REPERTOIRE.REFERENCE")=LISRSOU
 S @SCX@("REPERTOIRE.CIBLE")=LISRCIB
 S @SCX@("OBJET.CIBLE")=LISICIB
 S @SCX@("DOMAINE")=LISDOM
 S @SCX@("TAUX.ACCORD")=ACCAD
 S @SCX@("ARRET/PREMIER")=ARPREM
 S @SCX@("VISU")=VISU
 S @SCX@("ROUTINE.EVALUATION")=""
 S @SCX@("ETUDE")=ETU
 D ^%SCOA1(SCX,.NOML)
 S DEJAF2=0 D FIN^%SCOACT3
 D PA^%QSGESTI(REPE,ETU,"LISTE.COMPARABLES",NOML,1)
 D POCLEPA^%VVIDEO W $$^%QZCHW("creation de la liste des non comparables")
 S OK=$$COMPL^%QS0COMP(NOML,$$ADRLIS^%QSGEST7(NOML),$$ADRLIS^%QSGEST7(LL),.NOML2)
 I OK D PA^%QSGESTI(REPE,ETU,"LISTE.NON.COMPARABLES",NOML2,1)
 D POCLEPA^%VVIDEO
 I VISU=1 G INIT
 G RES
ETU D POCLEPA^%VVIDEO,MOD(ETU) G INIT
RES D EFFBAS G RES^%SCOACT2
REF D CLEPAG^%VVIDEO,^%QSATTRI(OBSOUR,$$NOMINT^%QSF(REPSOUR),1,0,78,23)
 S DEJAF=0,DEJAF2=1
 D ENTETE
 G ACT
IND 
 D AFFRES^%SCOACT2(LL,1,0),TITFEN^%SCOACT2
 S DEJAF=1
 G ACT
DOM 
 D ADR^%SCODDOM(DOM)
 G REAF2
REGLE 
 D CMS^%SCORGEN
 G REAF2
TIT D CLEPAG^%VVIDEO,^%VZCDB(TITRE,0)
 Q
 
LOAD 
 S REPSOUR=$$^%QSCALVA(REPE,ETU,"REPERTOIRE.REFERENCE")
 S OBSOUR=$$^%QSCALVA(REPE,ETU,"INDIVIDU.REFERENCE")
 S REPCIB=$$^%QSCALVA(REPE,ETU,"REPERTOIRE.CIBLE")
 S LCIB=$$^%QSCALVA(REPE,ETU,"LISTE.CIBLE")
 S TO=$$^%QSCALVA(REPE,ETU,"TAUX.ACCORD"),ACCAD=TO+0
 S ARPREM=$$^%QSCALVA(REPE,ETU,"ARRET.SUR.PREMIER.INDIVIDU")
 S DOM=$$^%QSCALVA(REPE,ETU,"DOMAINE")
 S DATE=$$^%QSCALVA(REPE,ETU,"DATE.MODIFICATION")
 S COMMENT=$$^%QSCALVA(REPE,ETU,"COMMENTAIRE")
 S NOML=$$^%QSCALVA(REPE,ETU,"LISTE.COMPARABLES")
 S NOML2=$$^%QSCALVA(REPE,ETU,"LISTE.NON.COMPARABLES")
 Q
ENTETE 
 D CLEPAG^%VVIDEO,^%VZCDB("activation de l'etude"_" "_ETU_$J("",45),0)
 S DY=0,DX=48 D REV^%VVIDEO X XY W $$^%QZCHW("modifie le")_" : "_DATE
 S DX=15,DY=1 D NORM^%VVIDEO,BLD^%VVIDEO X XY W "repertoires" S DX=45 X XY W "individus" S DX=60 X XY W "taux d'accord : ",TO
 S DX=2,DY=DY+1 D BLD^%VVIDEO X XY W "reference"
 D NORM^%VVIDEO S DX=15 X XY W $E(REPSOUR,1,20) S DX=45 X XY W $E(OBSOUR,1,20)
 S DX=2,DY=DY+1 D BLD^%VVIDEO X XY W "cible    "
 D NORM^%VVIDEO S DX=15 X XY W $E(REPCIB,1,20) S DX=45 X XY W $E(LCIB,1,20)
 S DX=2,DY=DY+1 X XY W "domaine : ",$E(DOM,1,20) S DX=45 X XY W "arret/1er : ",ARPREM
 S DX=2,DY=DY+1 X XY W "commentaire : ",$E(COMMENT,1,65)
 D CADRL
 Q:DEJAF2
 I $$IR^%QSGEST5("L0",LCIB) S LL=LCIB G ENT0
 I $D(LL) G ENT0
 S LL=$$GEN^%QCAPOP("TMP")
 D ^%VZEATT,^%QSGES11($$NOMINT^%QSF(REPCIB),LL,"TMP",0,"SAVOIR.COMPARER","")
 D STOCK^%QSGES11(LL,LCIB)
ENT0 D AFFRES^%SCOACT2(LL,0,DEJAF),TITFEN^%SCOACT2
 S DEJAF=1
 Q
 
MOD(ETU) 
 N RESUL,PATOUCH,ABENDSCR,CMS,OR,AFRESU,SCR,%AJM
 S RESUL(1)=ETU,SCR="SCOETUD",(ABENDSCR,CMS)=0
 D LOAD^%SCOETU2(ETU,.RESUL),^%VAFIGRI,^%VAFISCR
 D MOD^%SCOETUD(.RESUL)
 D KLIST(LL) K LL S DEJAF=0,DEJAF2=0
 Q
CADRL D CADSUP,CADINF Q
CADSUP D CARSP^%VVIDEO(1,6,8,78,1) Q
CADINF D CARSP^%VVIDEO(1,14,8,78,1) Q
EFFBAS S DX=0,DY=22 D CLEBAS^%VVIDEO Q
REAF I DEJAF2 D REAFF^%SCOACT3 G ACT
 D ENTETE G ACT
REAF2 D ENTETE I DEJAF2 D REAFF^%SCOACT3
 G ACT
KLIST(LL) 
 Q:(LL="")!(LL=LCIB)  D DEL^%QSGES11(LL) Q

