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

;%LNKACT2^INT^1^59547,73870^0
LNKACT2 ;
 
 
 
 
AFFRES(NL,MODE,DEJAF) 
 Q:NL=""
 I MODE=1 G AFF1
 I DEJAF D USE^%QUAPAGM("INDIVIDU"),AFFICH^%QUAPAGM Q
 S FEN0=$$CONCAS^%QZCHAD(TEMP,"INDIVIDU") K @(FEN0)
 I $D(@FEN0) D CLOSE
 D INIT(FEN0),OPEN^%QUAPAGM(FEN0,"INDIVIDU")
AFF1 D USE^%QUAPAGM("INDIVIDU")
 I '(DEJAF) D AFFICH^%QUAPAGM
 I MODE=0 Q
 D GO^%QUAPAGM
 Q
 
INIT(FEN) 
 S @FEN@("X")=OX,@FEN@("Y")=OY,@FEN@("L")=78,@FEN@("H")=21-OY
 S @FEN@("B")=$$^%QSCALVA("L0",NL,"BASE"),@FEN@("A")=$$ADRLIS^%QSGEST7(NL),@FEN@("ATT")=1,@FEN@("AFF")="REAFI^%LNKACT2"
 S @FEN@("LR")=15
 S @FEN@("C",1,"T")="  "_$$^%QZCHW("stade")_"  ",@FEN@("C",1,"L")=10,@FEN@("C",1,"C")="STADE"
 S @FEN@("C",2,"T")="       "_$$^%QZCHW("poche")_"      ",@FEN@("C",2,"L")=20,@FEN@("C",2,"C")="OBJET.TOTEM"
 S @FEN@("C",3,"T")=$$^%QZCHW("statut"),@FEN@("C",3,"L")=8,@FEN@("C",3,"C")="STATUT",@FEN@("C",3,"FCT")="$$STAT^%LNKACT2"
 S @FEN@("C",4,"T")=$$^%QZCHW("message erreur"),@FEN@("C",4,"L")=15,@FEN@("C",4,"C")="MESSAGE.ERREUR"
 Q
 
STAT(VT1,V,C) 
 I $$^%QSCALVA($$NOMINT^%QSF(REPS),V,"STADE")'="CONFIGURE" Q $$^%QSCALVA($$NOMINT^%QSF(REPS),V,C)
 N ETUDE
 S ETUDE=$$^%QSCALVA($$NOMINT^%QSF(REPS),V,"ETUDE.TOTEM")
 Q:ETUDE="" ""
 Q $$^%QSCALVA("ETUDE.TOTEM",ETUDE,"STATUS")
MSG(VT1,V,C) 
 N ETUDE,LIB
 S LIB=$$^%QSCALVA($$NOMINT^%QSF(REPS),V,C)
 I $$^%QSCALVA($$NOMINT^%QSF(REPS),V,"STADE")'="TRANSFERE" Q:LIB'="" LIB
 S ETUDE=$$^%QSCALVA($$NOMINT^%QSF(REPS),V,"ETUDE.TOTEM")
 Q:ETUDE="" ""
 Q $$^%QSCALVA("ETUDE.TOTEM",ETUDE,C)
END 
CLOSE 
 D CLOSE^%QUAPAGM("INDIVIDU")
 Q
REAFI 
 D ENTETE^%LNKACT
 Q
SEL(L1,L2) 
 N REP,GLO,OB
 D EFFBAS^%LNKACT,POCLEPA^%VVIDEO
 I L2'="" S DX=20,DY=23 X XY S REP=$$^%VZECH2("",$$^%QZCHW("selection precedente"),$$^%QZCHW("nouvelle selection")) D POCLEPA^%VVIDEO Q:REP=1  Q:REP=$$^%QZCHW("selection precedente")
 S DX=30,DY=23 X XY
 S REP=$$^%VZECH2("",$$^%QZCHW("selection"),$$^%QZCHW("tous"))
 D POCLEPA^%VVIDEO
 Q:(REP'=$$^%QZCHW("tous"))&(REP'=$$^%QZCHW("selection"))
 I REP=$$^%QZCHW("tous") S L2=L1 Q
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"SEL") K @(GLO)
 D ENS^%QUAPAGM(GLO)
 I $O(@GLO@(""))="" S L2="" Q
 S L2=$$GEN^%QCAPOP("TMP")
 D ^%VZEATT,^%QSGES11($$NOMINT^%QSF(REPS),L2,"TMP",0,"CONFIGURATEUR","")
 S OB="" F I=0:0 S OB=$O(@GLO@(OB)) Q:OB=""  D STOCK^%QSGES11(L2,OB)
 Q
 
NETIDT(LL2,REPS,POCHE,OK) 
 N OB,ADD S ADD=$$ADRLIS^%QSGEST7(LL2),OK=1
 I ADD="" S OK=0 Q
 S OB="" F I=0:0 S OB=$O(@ADD@(OB)) Q:OB=""  D PSO^%QSGESTI($$NOMINT^%QSF(REPS),OB,"IDENTIFIANT.TOTEM",1) I POCHE'="" D PA^%QSGESTI($$NOMINT^%QSF(REPS),OB,"OBJET.TOTEM",POCHE,1)
 Q
 
MAJIDT(LL2,REPS,STATUT) 
 N OB,ADD,ADD2,LERR S ADD=$$ADRLIS^%QSGEST7(LL2)
 I ADD="" Q
 S LERR=$$^%QSCALVA("L0",LL2,"LISTE.ERREURS")
 S ADD2=$$ADRLIS^%QSGEST7(LERR)
 S OB=""
LOOPM S OB=$O(@ADD@(OB))
 G:OB="" FLOOPM
 D PSO^%QSGESTI($$NOMINT^%QSF(REPS),OB,"MESSAGE.ERREUR",1)
 I $$AIR^%QSGE5($$NOMINT^%QSF(REPS),OB,"OBJET.TOTEM") D PA^%QSGESTI($$NOMINT^%QSF(REPS),OB,"STADE",STATUT,1)
 I (LERR="")!(ADD2="") D PA^%QSGESTI($$NOMINT^%QSF(REPS),OB,"STATUT","RAS",1) G LOOPM
 I $D(@ADD2@(OB)) G MAJIDT2
 D PA^%QSGESTI($$NOMINT^%QSF(REPS),OB,"STATUT","RAS",1)
 G LOOPM
FLOOPM Q:LERR=""
 D DEL^%QSGES11(LERR)
 D PS^%QSGESTI("L0",LL2,LERR,"LISTE.ERREURS",1)
 Q
MAJIDT2 
 D PA^%QSGESTI($$NOMINT^%QSF(REPS),OB,"STATUT","PB",1)
 I STATUT="TRANSFERE" D PA^%QSGESTI($$NOMINT^%QSF(REPS),OB,"MESSAGE.ERREUR",$$^%QSCALVA("ETUDE.TOTEM","ETUDE.TOTEM","MESSAGE.TRANSFERT.TODKBMS"),1)
 I STATUT="CONFIGURE" D PA^%QSGESTI($$NOMINT^%QSF(REPS),OB,"MESSAGE.ERREUR",$$^%QSCALVA("ETUDE.TOTEM","ETUDE.TOTEM","LIBELLE.ERREUR"),1)
 G LOOPM
 
MENU(MN) 
 S @MN="21^5^79"
 S @MN@(1)=$$^%QZCHW("etude")_"^"_"ETU",@MN@(1,"COM")=$$^%QZCHW("Modification des parametres de l'etude")
 S @MN@(2)=$$^%QZCHW("individus")_"^"_"IND",@MN@(2,"COM")=$$^%QZCHW("acces aux attributs d'un individu selectionne")
 S @MN@(3)=$$^%QZCHW("identifiant")_"^"_"IDT",@MN@(3,"COM")=$$^%QZCHW("calcul des identifiants")
 S @MN@(4)=$$^%QZCHW("configuration")_"^"_"CNF",@MN@(4,"COM")=$$^%QZCHW("activation du savoir-faire")
 S @MN@(5)=$$^%QZCHW("resultat")_"^"_"RST",@MN@(5,"COM")=$$^%QZCHW("resultat de la configuration pour un individu donne")
 S @MN@(6)=$$^%QZCHW("transfert")_"^"_"TRSF",@MN@(6,"COM")=$$^%QZCHW("transfert des resultats dans dkbms")
 S @MN@(7)=$$^%QZCHW("visu.nomenclature")_"^"_"VISU",@MN@(7,"COM")=$$^%QZCHW("edition de la nomenclature pour un individu donne")
 S @MN@(8)=$$^%QZCHW("eliminer")_"^"_"DEL",@MN@(8,"COM")=$$^%QZCHW("suppression des etudes deja activees sur les individus de la liste")
 S @MN@(9)=$$^%QZCHW("attributs")_"^"_"ATT",@MN@(9,"COM")=$$^%QZCHW("acces aux listes d'attributs")
 
 Q

