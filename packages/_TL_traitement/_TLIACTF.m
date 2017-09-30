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

;%TLIACTF^INT^1^59547,74029^0
%TLIACTF ;
 
 
DMD 
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Veuillez donner valeur attributs"))
 N ATTRI,LIB,REP2,IN,VAR,COUR,CTRLA,DX,DY,FILS,Y1,Y1BIS
 S COUR=0
BDMD D POCLEPA^%VVIDEO
 S COUR=COUR+1
 S FILS=$$RED(ACTI,COUR)
 G:FILS=0 FDMD
 S ATTRI=$$RED($$RED(FILS,1),"TEXTE")
 G:ATTRI="" BDMD
 S Y1=$$SUBST^%ANARBR2(FILS,.CXT,"",.POS)
 I '(POS) S Y1=""
 S Y1=$$DATA^%VZAME1(ATTRI_" = ",Y1)
 I Y1="" S ECHEC=1
 I CTRLA!(Y1="") G BDMD
 D AFF^%TLIACTS(FILS,Y1)
 G BDMD
FDMD D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Merci")) Q
 
 
ELI N NO,ATT,IND2,REP2,VA
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Elimination individu en cours"))
 G:$$RED(ACTI,1)=0 SELI
 S VA=$$RED($$RED($$RED(ACTI,1),1),"TEXTE")
 S IND2=$$OBPROX2^%QSCALVU(VA,CXT("@","BASE"),CXT("@","OBJET"),.REP2)
 I IND2="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom individu a eliminer")) S ECHEC=1 Q
 I REP2="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible trouver repertoire de l'individu a eliminer")) S ECHEC=1 Q
 D:MODEX=2 STIND^%TLBAATT(REP2,IND2,"","","SUPPRESSION")
 D:MODEX'=1 ^%QSUPSPE(REP2,IND2)
 D:MODEX'=1 SX^%QSGESTK(REP2,IND2) G FINELI
SELI 
 D:MODEX=2 STIND^%TLBAATT(REP,IND,"","","SUPPRESSION")
 D:MODEX'=1 ^%QSUPSPE(REP,IND)
 D:MODEX'=1 SX^%QSGESTK(REP,IND)
FINELI D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Individu elimine"))
 Q
 
 
 
EL 
 N ATT,VAR,IND,REP
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Elimination attribut en cours"))
 I '($$ATTR^%TLIACT4($$RED(ACTI,1),.ATT,.IND,.VAR,.REP)) S ECHEC=1 Q
 I $E(ATT)'="%" G ATTRNE
 
 I $$RED($$RED(ACTI,1),2)=0 D:MODEX=2 STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),ATT,"","*","SUPPRESSION") D:MODEX'=1 PSV^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ATT) G FINEL
 D:MODEX=2 STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),ATT,"","*","SUPPRESSION")
 
 
 I MODEX'=1 D PSO^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ATT,IND) K CXT(ATT)
 G FINEL
ATTRNE 
 I (ATT="NOM")!($$TYPE^%QSGEST9(REP,ATT)'=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit detruire attribut NOM ou un attribut lien")) S ECHEC=1 Q
 I $$RED($$RED(ACTI,1),2)=0 D:MODEX=2 STATT^%TLBAATT(REP,VAR,ATT,"","*","SUPPRESSION") D:MODEX'=1 PSV^%QSGESTI(REP,VAR,ATT) G FINEL
 D:MODEX=2 STATT^%TLBAATT(REP,VAR,ATT,"",IND,"SUPPRESSION")
 D:MODEX'=1 PSO^%QSGESTI(REP,VAR,ATT,IND)
FINEL D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Elimination terminee"))
 Q
 
 
TRAITL 
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Activation traitement sur 1 liste"))
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 S @TEMPO@(1)="M",@TEMPO@(2)="N",@TEMPO@(3)="O",@TEMPO@(4)="T"
 S @TEMPO@(5)="R",@TEMPO@(6)="S",@TEMPO@(7)="E",@TEMPO@(8)="POS"
 S @TEMPO@(9)="MESSA"
 D EMPV^%ANGEPIL(TEMPO) K @(TEMPO)
 D SAUVECR^%TLUTIL,SAUVVAL^%TLUTIL
 S MESSA="",TRLIS=1,TRBOUC=0,SELECIN=0
 S POS=1,TRT=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I (TRT="")!(POS=0) S:MODAF'="" MESSA=$$^%QZCHW("   Impossible de trouver le traitement") G MAJTL
 I '($$EXISTE^%TLINTER(TRT)) S:MODAF'="" MESSA=$$^%QZCHW("   Impossible de trouver le traitement") G MAJTL
 I '($$OKANA^%TLGEST(TRT)) S:MODAF'="" MESSA=TRT_$$^%QZCHW(": traitement non analyse") G MAJTL
 S LISTE=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I (LISTE="")!(POS=0) S:MODAF'="" MESSA=$$^%QZCHW("  Impossible evaluer nom liste") G MAJTL
 I '($$EX^%QSGEST7(LISTE)) S:MODAF'="" MESSA=$$^%QZCHW("  Liste ")_LISTE_$$^%QZCHW(" inconnue") G MAJTL
 S REP=$$^%QSCALVA("L0",LISTE,"BASE") I REP="" S L=3 G MAJTL
 S ADRRET="RETOURL^%TLIACTF"
 G SUIT^%TLIACTI
RETOURL S L=SORT
MAJTL D RESTVAL^%TLUTIL,RESTECR^%TLUTIL
 S HALT=0
 D:MESSA'="" ADD^%TLIFEN("LOG",MESSA)
 D DEPV^%ANGEPIL
 G REBOUCA^%TLIACT1
 
RED(N,A) 
 Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

