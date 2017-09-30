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

;%QMECNOE^INT^1^59547,73878^0
QMECNOE ;
 
INIT(REPFOC,INDFOC,LISFOC,ETUDE) 
 N GLOB,LIEN
 S ORIG="EVAL",MODAF=0,MODEX=0
 S CXT("@","BASE")=REPFOC,CXT("@","OBJET")=INDFOC
 
 I ETUDE=0 G INIAFF
 S CXT("%","BASE")=$$REPETD
 I ETUDE'=1 S CXT("%","OBJET")=ETUDE G IAFETD
CREETD 
 S CXT("%","OBJET")=$$GEN^%QCAPOP("EVA")
 I (REPFOC=CXT("%","BASE"))&(INDFOC="") S (INDFOC,CXT("@","OBJET"))=CXT("%","OBJET") D AFFLIG^%QMECAFF
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),"NOM",CXT("%","OBJET"),1)
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),"REPERTOIRE.FOCUS",$$NOMLOG^%QSF(REPFOC),1)
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),"INDIVIDU.FOCUS",INDFOC,1)
IAFETD 
 D LIEN^%QSGEL2(CXT("@","BASE"),CXT("%","BASE"),"GLOB")
 I GLOB=0 G CRELIS
 D ADDS^%QSGEST3(CXT("@","BASE"),CXT("@","OBJET"),$O(GLOB("")),CXT("%","BASE"),CXT("%","OBJET"))
CRELIS 
 S LISFOC=CXT("%","OBJET")
 D ^%QSGES11(REPFOC,LISFOC,"GDX",0,"","")
 D STOCK^%QSGES11(LISFOC,INDFOC)
INITTL 
 
 F I="LOG","ATT","ACT" D CREER^%TLBAGF1(I,1,1,1,1,1,1,"",0,"")
 
 D ^%TLFEXT
INIAFF 
 D ADD^%TLBAGF3("EVA",$$^%QZCHW("etude")_"            : "_CXT("%","OBJET"),4)
 Q
 
FIN(LISFOC,SAV) 
 N GLOB
 I ETUDE=0 S ETUDE=CXT("%","OBJET") Q
 
 
 F I="LOG","ATT","ACT" D TUER^%TLBAGF1(I)
 D DEL^%QSGES11(LISFOC)
 D LIEN^%QSGEL2(CXT("@","BASE"),CXT("%","BASE"),"GLOB")
 I GLOB'=0 D SUPS^%QSGEST3(CXT("@","BASE"),CXT("@","OBJET"),$O(GLOB("")),CXT("%","BASE"),CXT("%","OBJET"))
 S ETUDE=CXT("%","OBJET")
 G:SAV=1 FFIN
 D POCLEPA^%VVIDEO
 I '($$MES^%VZEOUI($$^%QZCHW("Voulez vous vraiment abandonner l'etude (sans sauvegarde) ? "),"O")) G FFIN
 D POCLEPA^%VVIDEO
 D SX^%QSGESTK(CXT("%","BASE"),CXT("%","OBJET"))
 Q
FFIN D POCLEPA^%VVIDEO,BLD^%VVIDEO,BLK^%VVIDEO W $$^%QZCHW("Sauvegarde en cours...") D NORM^%VVIDEO
 Q
 
EXPL 
 K @(TEMPO)
 S @TEMPO@(1)="TITRE",@TEMPO@(2)="TYP",@TEMPO@(3)="NOTE"
 S @TEMPO@(4)="ORD",@TEMPO@(5)="REGLE",@TEMPO@(6)="REAF"
 S @TEMPO@(7)="TRT",@TEMPO@(8)="ETIQ",@TEMPO@(9)="PARTIE"
 S @TEMPO@(10)="MODAF",@TEMPO@(11)="MODEX",@TEMPO@(12)="DEROUL"
 S @TEMPO@(13)="LISTE",@TEMPO@(14)="EXEC",@TEMPO@(14)="GLOETD"
 S @TEMPO@(15)="ARRET",@TEMPO@(16)="NIVEAU",@TEMPO@(17)="I"
 S @TEMPO@(18)="J",@TEMPO@(19)="LGLO",@TEMPO@(20)="SIND",@TEMPO@(21)="HALT"
 S MODAF=0,MODEX=0,DEROUL="PROCEDURAL"
 S I=20,J=""
BCGLO S J=$O(GLO(J)) I J'="" S @TEMPO@(I)="GLO("""_J_""")",I=I+1 G BCGLO
 D EMPV^%ANGEPIL(TEMPO)
 S LGLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LGLO") K @(LGLO)
 S SIND=0,HALT=0
 S ABANDON=$$ABORT(1) I ABANDON G ABANDON
 
 S REAF=0
 S TITRE=$$^%QSCALVA(REPNOE,NOEUD,"TITRE")
 D ADD^%TLBAGF3("EVA",$$^%QZCHW("noeud courant")_"    : "_NOEUD,5)
 D ADD^%TLBAGF3("EVA",$$^%QZCHW("titre")_"            : "_TITRE,6)
ACPRO 
 K @(LGLO)
 D MVG^%QSCALVA(REPNOE,NOEUD,"COMMENTAIRE.PROLOGUE",LGLO,.TYP)
 S NOTE="",ORD=$O(@LGLO@("")) I ORD'="" S NOTE=@LGLO@(ORD)
 I NOTE="" G EXREG
 D AFF^%QSNOTE2(0,11,80,11,REPNOE,NOEUD,"COMMENTAIRE.PROLOGUE",NOTE,ORD,CXT("@","BASE"),CXT("@","OBJET"),"$$AFFICH^%QMEAROU")
EXREG 
 K @(LGLO)
 D MVG^%QSCALVA(REPNOE,NOEUD,"REGLE",LGLO,.TYP)
 S REGLE="",ORD=""
BCREG 
 S ABANDON=$$ABORT(1) I ABANDON G ABANDON
 S ORD=$O(@LGLO@(ORD))
 I ORD="" G FEXPRO
 S REGLE=@LGLO@(ORD),TYP=$P(REGLE,"\",1),REGLE=$P(REGLE,"\",2,500)
 I TYP="QUEMANDER" D ACTAFF^%QMEAACT("SAISIE.I",REGLE,0,0,80,10,0,10,80,13,CXT("@","BASE"),CXT("@","OBJET"),"$$AFFICH^%QMEAROU","AFFECT^%QMEAROU") S REAF=1 G BCREG
 I TYP'="TRAITER" G RETEXR
 D ^%VZEATT
 S TRT=REGLE,ETIQ="",PARTIE="",LISTE=LISFOC
 I '($$OKANA^%TLINTER(TRT)) D ^%VZEAVT($$^%QZCHW("Analyse du traitement ")_TRT_$$^%QZCHW(" incorrecte")) G BCREG
 S GLOETD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S @GLOETD=$S($D(@GLOETD)#10:@GLOETD,1:0)+1
 S GLOETD=$$CONCAS^%QZCHAD(GLOETD,@GLOETD)
 S @GLOETD@("ETUDE")=CXT("%","OBJET")
 S (@GLOETD@("PAS.ARBRE"),@GLOETD@("PAS"))=0
 S MODAF=0,MODEX=0,DEROUL="PROCEDURAL",EXEC="",NIVEAU=0
 
 D EMPIL^%ANGEPIL("RETEXR^%QMECNOE") G ^%TLBADEB
 
 
RETEXR 
 D POCLEPA^%VVIDEO
 I ABANDON&((MODAF=2)!(MODAF=3)) S ABANDON=$$ABORT(0) I ABANDON G DEPIL^%ANGEPIL
 I ('(ABANDON))&((MODAF=2)!(MODAF=3)) S REAF=1
 K @(GLOETD)
 I ARRET S RESULT=1
 G BCREG
FEXPRO 
 
 S ABANDON=$$ABORT(1) I ABANDON G ABANDON
 I REAF D REAF^%QMECAFF
 K @(LGLO)
 D MVG^%QSCALVA(REPNOE,NOEUD,"COMMENTAIRE.EPILOGUE",LGLO,.TYP)
 S NOTE="",ORD=$O(@LGLO@("")) I ORD'="" S NOTE=@LGLO@(ORD)
 I NOTE="" G FEXEPI
 D AFF^%QSNOTE2(0,11,80,11,REPNOE,NOEUD,"COMMENTAIRE.EPILOGUE",NOTE,ORD,CXT("@","BASE"),CXT("@","OBJET"),"$$AFFICH^%QMEAROU")
FEXEPI 
 K @(LGLO)
 S ABANDON=$$ABORT(1)
 G DEPIL^%ANGEPIL
 
ABORT(ST) 
 I '(ST) G PQABD
 N T,F
 D ^%VZATOU(.T,.F,0,0) I T'=1 Q 0
PQABD 
 D POCLEPA^%VVIDEO
 Q $$MES^%VZEOUI($$^%QZCHW("abandon immediat")_" ? ","N")
 
REPETD() 
 Q $$NOMINT^%QSF("ETUDE")
 
ABANDON 
 D ADDJOUR^%QMECEVA(10,"arret demande par l'utilisateur")
 G DEPIL^%ANGEPIL

