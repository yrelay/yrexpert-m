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

;%TLBAMO^INT^1^59547,74028^0
TLBAMO ;
 I ((DEROUL="ARBRE")!(DEROUL="LINEAIRE.REMANENT"))!(DEROUL="ARBRE.REMANENT") G MOTARB
 
 K @(TEMPO) S @TEMPO@(1)="STOP",@TEMPO@(2)="I"
 S @TEMPO@(3)="ECHEC",@TEMPO@(4)="UNREU",@TEMPO@(5)="NUMRG"
 S @TEMPO@(6)="NUMPR",@TEMPO@(7)="L"
 S @TEMPO@(8)="DEBRAN"
 S @TEMPO@(9)="PLAN",@TEMPO@(10)="PLANR",@TEMPO@(11)="PLANE"
 S @TEMPO@(12)="CREPL"
 D EMPV^%ANGEPIL(TEMPO)
 
 D INITPL^%TLBAPL
 I MODEX'=3 G INIT
 S NUMPR=@PLANR
 S L=@PLAN,NUMRG=@PLAN@(L)
 S ECHGL=@GLOETD@(NIVEAU,"ECHEC.GLOBAL")
 S REUGL=@GLOETD@(NIVEAU,"REUSSITE.GLOBALE")
 S UNREU=@GLOETD@(NIVEAU,"UN.REUSSI")
 S STOP=0,ARRET=0,DEBRAN="",ECHEC=0
 G TLOKN
INIT 
 S NUMPR=1,REUGL=0
DEBUT S L=0,ECHGL=0,UNREU=0,STOP=0,ARRET=0,DEBRAN="",ECHEC=0
TRP 
 I STOP!(ABANDON!ARRET) G FTRP
 
 D REGSUI^%TLBAPL I NUMRG=0 G FTRP
TLOKN 
 
 D EMPIL^%ANGEPIL("CMPT^%TLBAMO") G ^%TLBACH
CMPT 
 
 
 G TRP
FTRP 
 I ((DEROUL="PROCEDURAL")!ABANDON)!((ETIQ'="")&(ARRET=1)) G ARRETS
 I (UNREU=1)&(ECHGL>0) G DEBUT
ARRETS 
 S @PLANR=NUMPR
 S @PLAN=L
 S @GLOETD@(NIVEAU,"ECHEC.GLOBAL")=ECHGL
 S @GLOETD@(NIVEAU,"REUSSITE.GLOBALE")=REUGL
 S @GLOETD@(NIVEAU,"UN.REUSSI")=UNREU
 D SUPPL^%TLBAPL
FPLAN 
 G DEPIL^%ANGEPIL
 
MOTARB 
 K @(TEMPO) S @TEMPO@(1)="STOP",@TEMPO@(2)="I"
 S @TEMPO@(3)="ECHEC",@TEMPO@(4)="NUMRG"
 S @TEMPO@(7)="L",@TEMPO@(8)="DEBRAN",@TEMPO@(9)="ROUTPL"
 D EMPV^%ANGEPIL(TEMPO)
 
 I DEROUL="ARBRE.REMANENT" S ROUTPL="^%TLBAPLA"
 I DEROUL="LINEAIRE.REMANENT" S ROUTPL="^%TLBAPLR"
 I DEROUL="ARBRE" S ROUTPL="^%TLBAPLG"
 D @("INITPL"_ROUTPL)
 I MODEX'=3 G INITAR
 S NUMPR=@PLANR
 S L=@PLAN,NUMRG=@PLAN@(L)
 S UNREU=@GLOETD@(NIVEAU,"UN.REUSSI")
 S STOP=0,ARRET=0,DEBRAN="",ECHEC=0
 G APPLI
INITAR 
 S STOP=0,ARRET=0,DEBRAN="",ECHEC=0
BCREG 
 I STOP!(ABANDON!ARRET) G FBCREG
 
 D @("REGSUI"_ROUTPL) I NUMRG=0 G FBCREG
APPLI 
 D EMPIL^%ANGEPIL("RETBCA^%TLBAMO") G ^%TLBACH
RETBCA 
 G BCREG
FBCREG 
 D @("STOPL"_ROUTPL)
 G DEPIL^%ANGEPIL

