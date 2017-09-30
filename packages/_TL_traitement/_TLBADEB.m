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

;%TLBADEB^INT^1^59547,74028^0
%TLBADEB ;
 K @(TEMPO) S @TEMPO@(1)="MODAFF",@TEMPO@(2)="REP",@TEMPO@(3)="IND"
 S @TEMPO@(4)="STOP",@TEMPO@(5)="ECHEC",@TEMPO@(6)="NUMRG"
 S @TEMPO@(7)="L",@TEMPO@(8)="DEBRAN",@TEMPO@(9)="ROUTPL"
 S @TEMPO@(10)="PLAN",@TEMPO@(11)="PLANE",@TEMPO@(12)="PLANR"
 S @TEMPO@(13)="EPIEX"
 D EMPV^%ANGEPIL(TEMPO)
 
 S NIVEAU=NIVEAU+1
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),"%NOM.TRAITEMENT.COURANT",TRT,1)
 I MODEX'=3 G STPAR
 S TRT=@GLOETD@(NIVEAU,"TRAITEMENT")
 I '($$OKANA^%TLGEST(TRT)) D ^%VZEAVT("Analyse du traitement est incorrecte"),DEPV^%ANGEPIL G SORTIE
 S ETIQ=@GLOETD@(NIVEAU,"SOUS.TRAITEMENT")
 S PARTIE=@GLOETD@(NIVEAU,"PARTIE")
 G INGLO
STPAR 
 S @GLOETD@("NIVEAU")=NIVEAU
 K @GLOETD@(NIVEAU)
 S @GLOETD@(NIVEAU,"TRAITEMENT")=TRT
 S @GLOETD@(NIVEAU,"SOUS.TRAITEMENT")=ETIQ
 S @GLOETD@(NIVEAU,"PARTIE")=PARTIE
 I MODAF=3 D LLINE^%TLBAIF
INGLO 
 I ETIQ="",$$INILIS^%TLBALIS G FSUITLI
 
 S MODAFF=0
 I (NIVEAU'=1)&(MODAF=2) S MODAFF=1
 I ETIQ'="" S MODAFF=2
 I MODAF'=0 D INIT^%TLBAIF(MODAFF)
 I (MODEX'=3)&((MODAF=1)!(MODAF=2)) D REAF^%TLBAIF(MODAFF)
 
 I ETIQ'="" G START
DEBTRT 
 G:(MODAF'=2)!(MODEX=3) BOUCIND
 D ADD^%TLIFEN("LOG"," "),ADD^%TLIFEN("LOG",$TR($J("",130-(NIVEAU*4))," ","*")),ADD^%TLIFEN("LOG"," ")
 D ADD^%TLIFEN("LOG",$$^%QZCHW("traitement")_" : "_TRT_" , "_$$^%QZCHW("liste")_" : "_LISTE)
BOUCIND 
 
 G:HALT BOUCF
 I $$NEXT^%TLBALIS G BOUCF
 I (MODEX'=3)&((MODAF=1)!(MODAF=2)) D REAF^%TLBAIF(3)
START 
 S ROUTPL=$$PLANIFIC
 D @("INITPL"_ROUTPL)
 S STOP=0,ARRET=0
BCREG 
 D @("REGSUI"_ROUTPL) I NUMRG=0 G FBCREG
APPLI 
 D PROREG^%TLBACH
 D EMPIL^%ANGEPIL("RETBCA^%TLBADEB") G ^%TLBAREG
RETBCA 
 D CLEAR^%SYSUTI1
 G:HALT BOUCF
 I $$EPIREG^%TLBACH G APPLI
 G BCREG
FBCREG 
 D @("STOPL"_ROUTPL)
RSTART 
 I ETIQ'="" G FAFFLI
 G BOUCIND
BOUCF 
 I (((('(ABANDON))!(ABANDON=1))&(MODAF=2))&(ETIQ=""))&(MODEX'=3) D ADD^%TLIFEN("LOG",$$^%QZCHW("fin du traitement")_" : "_TRT),ADD^%TLIFEN("LOG"," ")
 G:HALT FAFFLI
 I NIVEAU'=1 G FAFFLI
 I MODEX=3 S ROUTPL=$$PLANIFIC D @("INITPL"_ROUTPL) S STOP=0,ARRET=0
BCLEPI 
 S EPIEX=$$EPITRT^%TLBACH
 I '(EPIEX) G FAFFLI
 
 I EPIEX=1 D REINIT^%TLBALIS G DEBTRT
 
 D EMPIL^%ANGEPIL("RETEPX^%TLBADEB") G ^%TLBAREG
RETEPX 
 G BCLEPI
FAFFLI 
 D FINLIS^%TLBALIS
 I MODAF'=0 D END^%TLBAIF(MODAFF)
FSUITLI 
 S NIVEAU=NIVEAU-1
 I (ABANDON'=2)!(HALT=1) K @GLOETD@(NIVEAU+1) S @GLOETD@("NIVEAU")=NIVEAU
 G DEPIL^%ANGEPIL
PLANIFIC() 
 I DEROUL="PROCEDURAL" Q "^%TLBAPL"
 I DEROUL="FAIBLEMENT PROCEDURAL" Q "^%TLBAPL"
 I DEROUL="LINEAIRE.REMANENT" Q "^%TLBAPLR"
 I DEROUL="ARBRE" Q "^%TLBAPLG"
 I DEROUL="ARBRE.REMANENT" Q "^%TLBAPLA"
 I DEROUL="ARBRE.RECUSATION" Q "^%TLBAPLC"
 
DEBUT(TRT,LISTE,DEROUL,MODAF,MODEX,ETUDE) 
 N TEMPO,ECHGL,ABANDON,ORIG,EXEC,NIVEAU,GLOETD,ETIQ,PARTIE,CXT,ARRET
 N HALT,TRLIS,TRBOUC
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"PILE") K @(TEMPO)
 D INIT^%ANGEPIL
 
 D KILLVL^%TLIACTI
 S CXT("%","BASE")="%",CXT("%","OBJET")=$J
 S ORIG="TRAIT",EXEC="",NIVEAU=0,ABANDON=0,HALT=0,TRLIS=0,TRBOUC=0
 I (MODEX=0)!(MODEX=1) S GLOETD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ETUDE") G STPARD
 S GLOETD=$$CONCAS^%QZCHAD($$ADRESSE^%TLBAETD,ETUDE)
 I (MODEX'=3)&(MODEX'=4) G STPARD
 S ETUDE=@GLOETD@("ETUDE")
 S DEROUL=@GLOETD@("DEROULEMENT")
 S TRT=@GLOETD@("TRAITEMENT")
 S LISTE=@GLOETD@("LISTE")
 D REPRISE^%TLBAATT($S(MODEX=4:1,1:0)) S MODEX=3
 G INPAR
STPARD 
 S @GLOETD@("ETUDE")=ETUDE
 S @GLOETD@("DEROULEMENT")=DEROUL
 S @GLOETD@("TRAITEMENT")=TRT
 S @GLOETD@("LISTE")=LISTE
 S @GLOETD@("DATE")=$$DATE^%QMDATE_" "_$$HEURE^%QMDATE
 S @GLOETD@("HEURE.DEBUT")=$H,@GLOETD@("DUREE.EXECUTION")="0,0"
 S @GLOETD@("ATTRIBUT")=0
INPAR 
 S ETIQ="",PARTIE=""
 D ^%TLFEXT
 I MODAF=3 D CLEPAG^%VVIDEO,80^%VVIDEO S DX=0,DY=22 X XY W $$^%QZCHW("mise au point du traitement")," : ",TRT,"  ",$$^%QZCHW("sur la liste")," : ",LISTE,",  ",$$^%QZCHW("deroulement")," : ",DEROUL
 
 D EMPIL^%ANGEPIL("SORTIE^%TLBADEB") G ^%TLBADEB
SORTIE 
 D KILLVL^%TLIACTI
 
 I MODAF=3 D 80^%VVIDEO
 I (ABANDON'=2)!(MODEX'=2) K @(GLOETD)
 D EPIL^%ANGEPIL
 K @(TEMPO)
 Q
 ;

