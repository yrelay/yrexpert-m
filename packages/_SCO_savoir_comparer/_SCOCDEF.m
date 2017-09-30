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

;%SCOCDEF^INT^1^59547,73888^0
SCOCDEF ;
 
 
 
 
 
 
 N REPSOUR,OBSOUR,ACCAD,ARPREM,IGNORE,CTR,AD,MEN,TEMP,LISCIBLE
 N RESUL,CMS,NOMTAB,ABENDSCR,%I,SCR,FEN,LISDOM,NOMLIST
 N LISRSOU,MES,LISRCIB,LISICIB,LISRES
 S REPSOUR="",OBSOUR="",ACCAD=1,ARPREM="OUI",IGNORE="OUI",SCR="SCOCDEF"
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S MEN=$$CONCAS^%QZCHAD(TEMP,"MEN")
 S FEN=$$CONCAS^%QZCHAD(TEMP,"FEN")
 S LISDOM=$$CONCAS^%QZCHAD(TEMP,"DOMAINES")
 S LISCIBLE=$$CONCAS^%QZCHAD(TEMP,"CIBLES")
 S LISRSOU=$$CONCAS^%QZCHAD(TEMP,"REP.SOURCE")
 S LISRCIB=$$CONCAS^%QZCHAD(TEMP,"REP.CIBLE")
 S LISICIB=$$CONCAS^%QZCHAD(TEMP,"IND.CIBLE")
 S LISRES=$$CONCAS^%QZCHAD(TEMP,"LISTE.RESULTATS")
 S NOMLIST=$$CONCAS^%QZCHAD(TEMP,"TABLE.DE.LISTES")
 D MENGEN
 D INIT^%QUCHOIP("^[QUI]SCOMDOM",1,"",2,14,76,8)
 D REAFF
 G INFOGEN
BMEN D ^%VQUIKMN(0,80,22,MEN,.AD,.CTR)
 I CTR="R" D REAFF G BMEN
 G:CTR="" @AD
 G:(CTR="A")!(CTR="F") FIN
 G BMEN
 
 
 
INFOGEN S NOMTAB="",CMS=0,ABENDSCR=0
INFO2 D ^%VMODISC
 G:ABENDSCR BMEN
 F %I=1:1:5 Q:RESUL(%I)=""
 I RESUL(%I)="" D ^%VSQUEAK G INFO2
 S REPSOUR=RESUL(1),OBSOUR=RESUL(2),ACCAD=RESUL(3),ARPREM=RESUL(4),IGNORE=RESUL(5)
 G BMEN
 
 
 
CIBLES 
 D REAFCIB
 D ZLISTE2^%QULIMO(2,14,76,8,LISCIBLE,1,"CIBAJ^%SCOCDEF","SUP^%SCOCDEF","^%SCOCHLP")
 G BMEN
 
CIBAJ N PART1,PART2,REPI
 S OK=1
 S PART1=$$GETLBLAN^%VTLBLAN($P(Y1,"^")),PART2=$$GETLBLAN^%VTLBLAN($P(Y1,"^",2))
 G:PART1="" CIBAJER
 G:PART2="" CIBAJREP
 G:PART2=$$^%QZCHW("LISTE") CIBAJLIS
 
 S REP=PART2,IND=PART1
 S REPI=$$NOMINT^%QSF(REP)
 I REPI="" D ^%VZEAVT($$^%QZCHW("Repertoire inconnu...")) G CIBAJER
 G:IND'="?" CIBAJIN2
 D CHOIXIND^%SCOCUT
 D REAFF^%QULIMO3(1,1,LISCIBLE,2,14,76,8)
CIBAJIN2 I '($$IR^%QSGE5(REPI,IND)) D ^%VZEAVT($$^%QZCHW("Individu inconnu dans ce repertoire...")) G CIBAJER
 S Y1=IND_"^"_REP
 Q
 
CIBAJREP S REP=PART1
 G:REP'="?" CIBAJRE2
 D CHOIXREP^%SCOCUT
 D REAFF^%QULIMO3(1,1,LISCIBLE,2,14,76,8)
CIBAJRE2 S REPI=$$NOMINT^%QSF(REP)
 I REPI="" D ^%VZEAVT($$^%QZCHW("Repertoire inconnu...")) G CIBAJER
 S Y1=REP
 Q
 
CIBAJLIS S IND=PART1
 G:IND'="?" CIBAJLI2
 S REPI="L0"
 D CHOIXIND^%SCOCUT
 D REAFF^%QULIMO3(1,1,LISCIBLE,2,14,76,8)
CIBAJLI2 I '($$IR^%QSGE5("L0",IND)) D ^%VZEAVT($$^%QZCHW("Liste inconnue...")) G CIBAJER
 S Y1=IND_"^"_$$^%QZCHW("LISTE")
 Q
CIBAJER S OK=0
 Q
SUP S OK=1 Q
 
 
DOM D REAFF^%QUCHOYP(LISDOM)
 D ^%QUCHOYP(LISDOM)
 G BMEN
 
 
ACTI 
 S VISU=1
 S MES=""
 S MES=$$CONTPAR^%SCOACTR(REPSOUR,OBSOUR,ACCAD,ARPREM,VISU)
 I MES'="" D ^%VZEAVT($$^%QZCHW(MES)) G BMEN
 S MES=$$CONTDOM^%SCOACTR(LISDOM,LISRSOU,LISRCIB,VISU)
 I MES'="" D ^%VZEAVT($$^%QZCHW(MES)) G BMEN
 I '($D(@LISRSOU@(REPSOUR))) D ^%VZEAVT(REPSOUR_" "_$$^%QZCHW("n'est pas un repertoire source")) G BMEN
 S MES=$$CONTCIB^%SCOACTR(LISCIBLE,LISICIB,VISU)
 I MES'="" D ^%VZEAVT($$^%QZCHW(MES)) G BMEN
 S DY=22 D CLEBAS^%VVIDEO S DX=0,DY=23 X XY S VISU=$$^%VZECH2($$^%QZCHW("Activation en mode "),"VISIBLE","INVISIBLE")
 S VISU=$S(VISU="INVISIBLE":0,VISU="VISIBLE":1,1:"")
 I VISU="" D POCLEPA^%VVIDEO,MENGEN G BMEN
 
 D POCLEPA^%VVIDEO,MSG^%VZEATT($$^%QZCHW("Activation en cours ..."))
 K @(NOMLIST)
 D ^%SCOA111(REPSOUR,OBSOUR,ACCAD,ARPREM,IGNORE,LISDOM,LISICIB,LISRSOU,LISRCIB,VISU,NOMLIST,"")
 D CRETUD^%SCOCDF2(.ETUD,NOMLIST)
 I '($D(@LISRES@(REPSOUR,OBSOUR))) S @LISRES@(REPSOUR,OBSOUR)=0
 S @LISRES@(REPSOUR,OBSOUR,ETUD)="",@LISRES@(REPSOUR,OBSOUR)=@LISRES@(REPSOUR,OBSOUR)+1
FACTI D MENGEN D:VISU=1 REAFF
 G BMEN
 
RES 
RES1 I '($D(@LISRES@(REPSOUR,OBSOUR))) D ^%VSQUEAK G BMEN
 G RES^%SCOCDF2
 
 
 
 
MENGEN S @MEN="21^10^79"
 S @MEN@(1)=$$^%QZCHW("Individus.cibles")_"^CIBLES"
 S @MEN@(2)=$$^%QZCHW("Domaines initiaux")_"^DOM"
 S @MEN@(3)=$$^%QZCHW("Caracteristiques")_"^INFOGEN"
 S @MEN@(4)=$$^%QZCHW("Activation")_"^ACTI"
 S @MEN@(5)=$$^%QZCHW("Resultats")_"^RES"
 Q
 
 
FIN D END^%QUCHOIP
 K @(TEMP)
 Q
 
 
REAFF D CLEPAG^%VVIDEO
 S RESUL(1)=REPSOUR,RESUL(2)=OBSOUR,RESUL(3)=ACCAD,RESUL(4)=ARPREM,RESUL(5)=IGNORE
 D ^%VAFIGRI,^%VAFISCR
REAFCIB D CARSA^%VVIDEO(2,14,76,8),REAFF^%QULIMO3(1,1,LISCIBLE,2,14,76,8)
 Q

