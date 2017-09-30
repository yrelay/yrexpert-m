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

;TORQY^INT^1^59547,74875^0
TORQY ;
 
 
 N LILAB,TEMP,RI,LILA
SU 
 D ETUDE(.NUET,.ABORT)
 Q:ABORT
 
 S BASE=$$^%QSCALVA("ETUDE.TOTEM",NUET,"REPERTOIRE.RECEPTEUR")
 S CHOIX="NON" D:BASE'="" REPERT
 I (BASE="")!(CHOIX="NON") D INIT(.BASE,.BASI,.FILS,.ABORT) Q:ABORT
 
 I BASE=$$^%QSCALVA("ETUDE.TOTEM",NUET,"REPERTOIRE.RECEPTEUR") S CH=$$PROPO G:CH ATTRI
RECOM S GLO=0 D SAISIND^TORQY2(.%CUK,.ABORT) G:ABORT FINI
 I GLO=0 S GLO(1)=%CUK
 
 
ATTRI G:$$^%QMLILL(.LILA) FINI
 I LILA="" D ^%VZEAVT("Attention il faut au moins transferer un attribut") G ATTRI
 
 D POCLEPA^%VVIDEO
TRT S DX=0,DY=23 X XY S REP=$$^%VZECH2("OK pour le transfert de l'etude selectionnee "_NUET_" ","OUI","NON") G:REP="NON" FINI G:REP="OUI" OK G:CTRLA FINI G TRT
OK D ^%VZEATT
 D LISTE(LILA,.LISTE)
 
 
 S TW="0"
 S GAM=$S($D(^[QUI]CONS(NUET)):1,1:0)
 
 D LIEN^%QSGEST9(BASI,"GLOBA")
 S FILS=$S(GLOBA=2:1,1:0)
 S %CU="" F C=1:1 S %CU=$O(GLO(%CU)) G:%CU="" RECOM S %CUK=GLO(%CU) D ^TORQY2(NUET,TW,.LISTE,BASI,%CUK,GAM,FILS)
 
FINI G SU
 
PROPO() 
 
 
 D MVI^%QSCALVA("ETUDE.TOTEM",NUET,"INDIVIDU.RECEPTEUR",.GLO,.TYP) Q:GLO=0 0
 S DX=0,DY=3 D CLEBAS^%VVIDEO S DX=0,DY=5 X XY
 W $$^%QZCHW("Le(s) individu(s) associe(s) a votre etude "_NUET_" est(sont) : ")
 D BLD^%VVIDEO S DX=10,DY=DY+1,IND="" F G=1:1 S IND=$O(GLO(IND)) Q:IND=""  S DY=DY+1 X XY W GLO(IND)
PROP D NORM^%VVIDEO S DX=0,DY=DY+1 X XY S REPON=$$MES^%VZEOUI($$^%QZCHW("Voulez vous effectuer le transfert sur cet(ces) individu(s) ? "),"O") Q:REPON=-1 0
 Q:REPON=1 1 Q:REPON=0 0 Q:REPON="OUI" 1 G PROP
 
LISTE(ZLILA,LISTE) 
 
 N ADR,I,ATT,OATT
 I ZLILA="*" S LISTE="*" Q
 S ADR=$$LIST^%QMLILA(ZLILA)
 I ADR="" S LISTE="*" Q
 S OATT=$O(@ADR@(""))
 F I=0:0 Q:(OATT="")!(OATT]"A")  S:@ADR@(OATT)'="" LISTE(@ADR@(OATT))="" S OATT=$O(@ADR@(OATT))
 Q
 
REPERT 
 
 S DX=0,DY=22 X XY
 W $$^%QZCHW("Le repertoire associe a votre etude est : "_$$^%QSCALVA("ETUDE.TOTEM",NUET,"REPERTOIRE.RECEPTEUR"))
 S DX=0,DY=23 X XY
 S CHOIX=$$^%VZECH2("Voulez-vous effectuer le transfert sur ce repertoire ","OUI","NON") S:CHOIX="OUI" BASI=$$NOMINT^%QSF(BASE) Q
 
INIT(BASE,BASI,FILS,ABORT) 
 I '($D(^[QUI]RQSAUTOR(WHOIS))) D ^%VZEAVT($$^%QZCHW("Veuillez contacter YXP, vous ne pouvez choisir un repertoire ")) W $$^%QZCHW("Merci") H 1 D POCLEPA^%VVIDEO S ABORT=0 Q
 S B="" F %B=0:0 S B=$O(^[QUI]RQSAUTOR(WHOIS,B)) Q:B=""  S:B'="z" LBASE(0,B)=""
 S DX=0,DY=3 X XY D CLEBAS^%VVIDEO
 S DX=20,DY=5 X XY W $$^%QZCHW("Choix du repertoire")
 D INIT^%QUCHOIP("LBASE(0)",1,"",20,7,30,15)
L0 D AFF^%QUCHOIP
 S BASE=$$UN^%QUCHOIP G:BASE="" FIN S BASI=$$NOMINT^%QSF(BASE)
 I $$REPVID^%QSGEST5(BASI) D ^%VZEAVT($$^%QZCHW("Ensemble vide ")) G L0
 D LIEN^%QSGEST9(BASI,"GLOBA") S FILS=$S(GLOBA=2:1,1:0)
 S ABORT=0 Q
FIN D END^%QUCHOIP S ABORT=1 Q
 
CAD 
 D CLEPAG^%VVIDEO,^%VZCD(0,39,0,2,1,0,$$^%QZCHW("TRANSFERT TOTEM ----> DKBMS")) Q
 
ETUDE(NUET,ABORT) 
 
 D CAD
 S FEN("X")=0,FEN("Y")=3,FEN("L")=80,FEN("H")=19,FEN("B")="ETUDE.TOTEM",FEN("A")=$$LISTIND^%QSGEST6("ETUDE.TOTEM"),FEN("ATT")=1,FEN("AFF")="REAFI^TORQY"
 S FEN("PADLINE")="POCLEPA^%VVIDEO" D INIT^%QUAPAGM("FEN")
 D AFFICH^%QUAPAGM
 S NUET=$$UN^%QUAPAGM I NUET="" S ABORT=1 Q
 S ABORT=0 Q
REAFI D CAD Q

