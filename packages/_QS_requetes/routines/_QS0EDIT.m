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

;%QS0EDIT^INT^1^59547,73879^0
QS0EDIT(MOD) 
 
 
 
 
 
 
 
 
 
 
 
 
 N ADR,ADRLIS,ADRES,CONTR,BA,LISTE,TYP
 G:MOD=1 CREER
 
 D ^%QUAPAD($$^%QZCHW("EDITEUR DE LISTE"))
 
 S LISTE=$$UN^%QUAPAGM Q:LISTE="" 1
 
 S ADR=$$ADRLIS^%QSGEST7(LISTE)
 S TYP=$$TYP^%QSGEST7(LISTE),BA=$$REP^%QSGEST7(LISTE)
 I ADR="" D ^%VZEAVT($$^%QZCHW("Impossible de retrouver les objets de cette liste")) Q 1
 I (BA="")&(TYP="INDIVIDU") D ^%VZEAVT($$^%QZCHW("Impossible de retrouver le repertoire des individus de cette liste")) Q 1
SUITE 
 
 D MANI1(LISTE,"AJ^%QS0EDIT","SUP^%QS0EDIT") Q 2
 
CREER 
 D TITRE
NL 
 S DX=10,DY=8 D CLEBAS^%VVIDEO
 S TL=$$^%VZAME1($$^%QZCHW("Prefixe du nom de la liste")_" : ") Q:CTRLA 2
 I TL="?" D ^%VZEAVT($$^%QZCHW("En 3 lettres, RQS par defaut, ou par exemple VAL pour une liste d'objets quelconque")) G NL
 I TL="" S TL="RQS"
 I $L(TL)'=3 D ^%VZEAVT($$^%QZCHW("Le prefixe doit etre compose de 3 caracteres")) G NL
 G:MOD=2 CRE
 S DX=10,DY=12 X XY W $$^%QZCHW("Type d'objet de la liste")," : "
 S TABC(1)=$$^%QZCHW("Individu")_"^"_"IND"
 S TABC(2)=$$^%QZCHW("Valeur")_"^"_"VAL"
ACT D ^%VQUIKMN(36,75,12,"TABC",.ADRES,.CONTR)
 Q:(CONTR="A")!(CONTR="F") 2
 G:ADRES'="" @ADRES G ACT
VAL S TYP="VALEUR",BA="" G CRE
IND S TYP="INDIVIDU"
 S DX=10,DY=16 D CLEBAS^%VVIDEO
 S BA=$$^%VZAME1($$^%QZCHW("Repertoire des individus")_" : ") Q:CTRLA!(BA="") 2
 I BA="?" S BA=$$SEL^%QSGEST6("^[QUI]RQSAUTOR(WHOIS)",$$^%QZCHW("Choisissez un repertoire")) D TITRE,AFF G:BA="" IND G CRE
 I '($$REPM^%QSGEST9(BA)) D ^%VZEAVT($$^%QZCHW("Repertoire inconnu")) G IND
CRE S LISTE=$$NOM^%QSGES11(TL)
 D MSG^%VZEATT($$^%QZCHW("Creation de la liste de nom ")_LISTE_$$^%QZCHW(" en cours"))
 
 D CRETYP^%QSGES11($$NOMINT^%QSF(BA),LISTE,TL,0,"MANUELLE",$$STO^%QSGES11(LISTE),"MANUELLE",TYP,"")
 G SUITE
 
TITRE D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("Creation d'une liste")) Q
AFF S DX=10,DY=8 X XY W $$^%QZCHW("Prefixe du nom de la liste")," : ",TL
 S DY=12 X XY W $$^%QZCHW("Type d'objet de la liste")," : ",TYP
 S DY=16 X XY W $$^%QZCHW("Base des individus")," : ",BA
 Q
 ;;
MANI(LISTE) 
 D MANI1(LISTE,"AJ^%QS0EDIT","SUP^%QS0EDIT")
 Q
MANI1(LISTE,UCAJ,UCSU) 
 
 
 
 
 
 
 
 
 N BA,TEMP,I,J,STO,TRIE,NONTRIE,ADR,TYP
 S BA="",TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S TRIE=$$CONCAS^%QZCHAD(TEMP,"TRIE")
 S NONTRIE=$$CONCAS^%QZCHAD(TEMP,"NONTRIE")
 S STO=$$ADRLIS^%QSGEST7(LISTE)
 S ADR=$$ADRLT^%QSGEST7(LISTE)
 S TYP=$$TYP^%QSGEST7(LISTE)
 I ADR="" D TRI^%QSGES11(LISTE,.ADR)
 I TYP="" S TYP="INDIVIDU"
 I TYP="INDIVIDU" S BA=$$BASE^%QSGEST7(LISTE)
 D ^%VZEATT
 S I="" F J=1:1 S I=$O(@ADR@(I)) Q:I=""  S @TRIE@(J)=@ADR@(I),@NONTRIE@(@ADR@(I))=""
 
 D USE^%QS0(LISTE)
 D TIT
 
 D ZLISTE3^%QULIMO(0,3,80,19,TRIE,1,UCAJ,UCSU,1)
 
 D POCLEPA^%VVIDEO
 K @(ADR),@(STO)
 S I="" F J=1:1 S I=$O(@TRIE@(I)) Q:I=""  S @ADR@(I)=@TRIE@(I),@STO@(@TRIE@(I))=I
 
 D CARDL^%QSGES11(LISTE)
 K @(TEMP)
 Q
 
TIT 
 D CLEPAG^%VVIDEO,^%VZCD(0,39,0,2,1,0,LISTE)
 
 D CARSA^%VVIDEO(0,3,80,19),REAFF^%QULIMO3(1,1,TRIE,0,3,80,19)
 Q
 
AJ 
 D POCLEPA^%VVIDEO
 S OK=1 I TYP'="INDIVIDU" G PRES
 I Y1="?" S Y1=$$SELECT^%QSGEST6($$LISTIND^%QSGEST6(BA),"Liste des individus existants") D TIT I Y1="" S OK=0 Q
 I '($$IR^%QSGEST5(BA,Y1)) D MSG^%VZEATT($$^%QZCHW("l'individu")_" "_Y1_" "_$$^%QZCHW("est inconnu dans la base")_" "_$$NOMLOG^%QSF(BA)) S OK=0 H 2 D POCLEPA^%VVIDEO Q
PRES I $D(@NONTRIE@(Y1)) D ^%VZEAVT($$^%QZCHW("Cet individu existe deja")) S OK=0 Q
 S @NONTRIE@(Y1)="" Q
SUP 
 S OK=1
 K @NONTRIE@(Y1)
 Q
 
 
 
 
 
 
 
 
 
 
REP(BA) 
 N ADR,ADRLIS,ADRES,CONTR,LISTE,TYP,MOD,TYP
 I '($$REPM^%QSGEST9(BA)) D ^%VZEAVT($$^%QZCHW("Repertoire inconnu")) Q 0
 S MOD=2
 S TYP="INDIVIDU"
 G CREER

