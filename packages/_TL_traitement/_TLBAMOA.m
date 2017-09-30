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

;%TLBAMOA^INT^1^59547,74028^0
TLBAMO ;
 K @(TEMPO) S @TEMPO@(1)="STOP",@TEMPO@(2)="I"
 S @TEMPO@(3)="ECHEC",@TEMPO@(4)="UNREU",@TEMPO@(5)="NUMRG"
 S @TEMPO@(6)="NUMPR",@TEMPO@(7)="L"
 S @TEMPO@(8)="DEBRAN"
 D EMPV^%ANGEPIL(TEMPO)
 
 D INIARB^%TLBAPLA
 I MODEX'=3 G INIT
 S NUMPR=@PLANR
 S L=@PLAN,NUMRG=@PLAN@(L)
 S ECHGL=@GLOETD@(NIVEAU,"ECHEC.GLOBAL")
 S REUGL=@GLOETD@(NIVEAU,"REUSSITE.GLOBALE")
 S UNREU=@GLOETD@(NIVEAU,"UN.REUSSI")
 S STOP=0,ARRET=0,DEBRAN="",ECHEC=0
 G TLOKN
INIT 
DEBUT S L=0,ECHGL=0,UNREU=0,STOP=0,ARRET=0,DEBRAN="",ECHEC=0
TRP 
 I STOP!(ABANDON!ARRET) G FTRP
 
 D REGSUI^%TLBAPLA I NUMRG=0 G FTRP
TLOKN 
 
APPLI 
 S L=NUMRG
 D EMPIL^%ANGEPIL("CMPT^%TLBAMOA") G ^%TLBACH
CMPT 
 
 
 G TRP
FTRP 
 
 
ARRETS 
 D STOARB^%TLBAPLA
FPLAN 
 G DEPIL^%ANGEPIL
 
REGSUI 
 
 I DEBRAN'="" S NUMRG=DEBRAN D RECHL^%TLBAINT S DEBRAN="",L=L-1
CONDL 
 S L=L+1
 I L>$ZP(@PLAN@("")) S NUMRG=0 G FRSUI
 
 S NUMRG=@PLAN@(L)
 I $$REUSSI^%TLBAINT G CONDL
FRSUI 
 Q
 
TRTRES 
 I ECHEC=-1 G FTRES
 
 I ECHEC=1 S ECHGL=ECHGL+1,@PLANE@(NUMRG)="" G FTRES
REGREU 
 S UNREU=1,@PLANR@(NUMPR)=NUMRG,NUMPR=NUMPR+1
 S REUGL=REUGL+1 K @PLANE@(NUMRG)
FTRES 
 S ECHEC=0
 Q

