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

;%QWANA3^INT^1^59547,73886^0
QWANA3 ;
 
 
 
 
 
LIREMOT() 
 N MOT,I
 S MOT=PCAR,VALC=$E(VALC,2,$L(VALC))
 F I=0:0 Q:VALC=""  S PCAR=$E(VALC) Q:PCAR=""""  S MOT=MOT_PCAR,VALC=$E(VALC,2,$L(VALC))
 Q MOT
 
 
 
 
 
 
 
LIREATT() 
 N MOT,CA,I
 S MOT=PCAR,VALC=$E(VALC,2,$L(VALC))
 F I=0:0 Q:VALC=""  S PCAR=$E(VALC),CA=$A(PCAR) Q:(((CA<48)!(CA>57))&(CA'=46))&((CA<65)!(CA>90))  S MOT=MOT_PCAR,VALC=$E(VALC,2,$L(VALC))
 Q MOT
 
LIREROUT() 
 N MOT,I,CA
 Q:VALC="" ""
 S MOT=""
SETIQ G:PCAR="^" LICORP
 S CA=$A(PCAR) Q:((CA<48)!(CA>57))&((CA<65)!(CA>90)) ""
 S MOT=MOT_PCAR
 S VALC=$E(VALC,2,$L(VALC)) Q:VALC="" ""
 S PCAR=$E(VALC)
 G SETIQ
LICORP S VALC=$E(VALC,2,$L(VALC)) Q:VALC="" ""
 S PCAR=$E(VALC),MOT=MOT_"^"
 S CA=$A(PCAR) Q:((CA<48)!(CA>57))&((CA<65)!(CA>90)) ""
SCORPS S MOT=MOT_PCAR
 S VALC=$E(VALC,2,$L(VALC)) Q:VALC="" MOT
 S PCAR=$E(VALC),CA=$A(PCAR)
 Q:((CA<48)!(CA>57))&((CA<65)!(CA>90)) MOT
 G SCORPS
 
LIRENB() 
 N NB
 S NB=PCAR,VALC=$E(VALC,2,$L(VALC))
 F I=0:0 Q:VALC=""  S PCAR=$E(VALC) Q:(PCAR'=".")&('($$PARA^%QZNBN1(PCAR)))  Q:(PCAR=".")&TWOPT  S:PCAR="." TWOPT=1 S NB=NB_PCAR,VALC=$E(VALC,2,$L(VALC))
 Q NB
 
LEX(ROUTAFF,MOT) 
 N EX,MOT2
 S EX=$$LEX^%LXSTOCK(MOT,.MOT2)
 
 I EX=1 G FEX
 
 I '(TRACEANA) Q 0
 I EX=2 D ^%VZEAVT($$^%QZCHW("Attribut ambigu"))
 I EX=0 D ^%VZEAVT($$^%QZCHW("Attribut inconnu"))
 
 D LEXIQ^%LXSTOCK(ROUTAFF)
 S EX=$$LEX^%LXSTOCK(MOT,.MOT2)
 I EX'=1 Q 0
FEX D MSG^%VZEATT(MOT_" --> "_MOT2) H 3 D POCLEPA^%VVIDEO
 S MOT=MOT2
 Q 1
 
 
INIT(X,Y) S SYNTX=X,SYNTY=Y,MAXM=250,LRG=80 Q
 
AFFMES(CODE) 
 I CODE=1 Q $$^%QZCHW("Chaine trop longue")
 I CODE=2 Q $$^%QZCHW("Attribut inconnu")
 I CODE=3 Q $$^%QZCHW("Chaine vide ==> probleme")
 I CODE=4 Q $$^%QZCHW("Attribut attendu")
 I CODE=5 Q $$^%QZCHW("Parenthese inattendu")
 I CODE=6 Q $$^%QZCHW("Point virgule attendu")
 I CODE=7 Q $$^%QZCHW("Trop de parentheses")
 I CODE=8 Q $$^%QZCHW("Operateur invalide")
 I CODE=9 Q $$^%QZCHW("Expression invalide")
 I CODE=10 Q $$^%QZCHW("Routine invalide")
 Q ""

