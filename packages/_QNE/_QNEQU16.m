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

;%QNEQU16^INT^1^59547,73879^0
%QNEQU16 ;
 
TRTNORM 
 
 
 
 
 
 
 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  $EQUILIBRER : Activation")_" "_LTA)
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 S @TEMPO@(1)="M",@TEMPO@(2)="N",@TEMPO@(3)="O",@TEMPO@(4)="T"
 S @TEMPO@(5)="R",@TEMPO@(6)="S",@TEMPO@(7)="E",@TEMPO@(8)="POS"
 S @TEMPO@(9)="MESSA"
 
 D EMPV^%ANGEPIL(TEMPO) K @(TEMPO)
 
 D SAUVVAL^%TLUTIL
 
 D REMCTR^%SYSCLAV
 S MESSA=""
 S TRT=NTR
 I '($$EXISTE^%TLINTER(TRT)) S:MODAF'="" MESSA=$$^%QZCHW("   Impossible de trouver le traitement") G MAJTL
 I '($$OKANA^%TLGEST(TRT)) S:MODAF'="" MESSA=TRT_$$^%QZCHW(": traitement non analyse") G MAJTL
 S LISTE=NLI
 I '($$EX^%QS0(LISTE)) S:MODAF'="" MESSA=$$^%QZCHW("  Liste ")_LISTE_$$^%QZCHW(" inconnue") G MAJTL
 S REP=$$^%QSCALVA("L0",LISTE,"BASE") I REP="" S L=3 G MAJTL
 S ADRRET="RETOURL^%QNEQU16"
 S SELECIN=0
 G SUIT^%TLIACTI
RETOURL S L=SORT
MAJTL D RESTVAL^%TLUTIL
 
 D:MESSA'="" ADD^%TLIFEN("LOG",MESSA)
 D DEPV^%ANGEPIL
 G @NADRT
 
TRTMAP 
 
 
 
 
 
 
 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  $EQUILIBRER : Activation")_" "_LTA)
 K @(TEMPO) S @TEMPO@(1)="EXTRT",@TEMPO@(2)="OLISTE"
 S @TEMPO@(3)="BA",@TEMPO@(4)="T",@TEMPO@(5)="OBJ",@TEMPO@(6)="POS"
 S @TEMPO@(7)="SIND",@TEMPO@(8)="ETIQ",@TEMPO@(9)="PARTIE"
 S @TEMPO@(10)="I",@TEMPO@(11)="REP",@TEMPO@(12)="IND"
 S @TEMPO@(13)="ECHGL"
 S I=14,T=""
BCXT S T=$O(CXT(T)) I T="" G PILE
 S @TEMPO@(I)="CXT("""_T_""",""BASE"")",@TEMPO@(I+1)="CXT("""_T_""",""OBJET"")"
 S I=I+2
 G BCXT
 
PILE D EMPV^%ANGEPIL(TEMPO)
 
 S EXTRT=$$^%QCAZG("TRT"),OLISTE=$$^%QCAZG("LISTE")
 I MODEX=3 G EXEC
 
 
 S TRT=NTR
 I '($$EXISTE^%TLINTER(TRT)) D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible trouver le traitement")) S ECHEC=1 G MAJ
 S LISTE=NLI
 I '($$EX^%QS0(LISTE)) D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Liste ")_LISTE_$$^%QZCHW(" inconnue")) S ECHEC=1 G MAJ
 
EXEC S SIND=0,ETIQ="",PARTIE=""
 D EMPIL^%ANGEPIL("RETOUR^%QNEQU16")
 G ^%TLBADEB
 
RETOUR 
 I ECHGL>0 S ECHEC=1
MAJ 
 S TRT=EXTRT,LISTE=OLISTE
 I (ORIG'="TRAIT")!ABANDON G FTRAITER
 I MODAF=2 D REAF^%TLBAIF(1)
 I MODAF=1 D REAF^%TLBAIF(0)
 
FTRAITER 
 G @NADRT
 ;

