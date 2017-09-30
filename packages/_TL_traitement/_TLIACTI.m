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

;%TLIACTI^INT^1^59566,67490^0
%TLIACTI ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ACTIVL(TRT,LISTE,MODAF,MODEX) 
 N CXT,KVARLOC,ABANDON,GDX,SELECIN,SOUSENS
 S GDX=0,KVARLOC=1,SELECIN=0
 G AA1
 
 
 
ACTIVS(TRT,LISTE,MODAF,MODEX,SOUSENS) 
 N CXT,KVARLOC,ABANDON,GDX,SELECIN
 S GDX=0,KVARLOC=1,SELECIN=1
 G AA1
 
 
 
CONTEXTL(TRT,LISTE,MODAF,MODEX,KVARLOC,CXT,ABANDON) 
 N SELECIN
 S SELECIN=0
 G AA1
 
 
AA1 N ACTI,ADR,ADRRET,ARRET,CARD,CTRLA,COND,JRN
 N DEROUL,DX,DY,EXP,ETIQ,FIRST,GLOSTO,HACT,HH,MG,MD,HALT,IND,ITRI,%IND
 N L,LI,LL,LTRI,MODAFF,NBT,NOM,NX,NY,NOEUACT,ORIG,ORIGINE,POS,REP,REPL
 N RETOURGO,RETOUROK,SIND,SORT,STOP,TETE,TEXT,TRBOUC,TRLIS,TYP,V,VAR
 I '($$OKANA^%TLGEST(TRT)) D ^%VSQUEAK,POCLEPA^%VVIDEO W TRT_$$^%QZCHW(": traitement non analyse") H 5 Q 1
 S REP=$$^%QSCALVA("L0",LISTE,"BASE") I REP="" Q 3
 
 D REMCTR^%SYSCLAV
 D SET^%SGVAR("MAP",0)
 D:KVARLOC KVARLOC
 K ^SAVVAL($J,"%")
 S TRLIS=0,TRBOUC=0
 S ORIG="TRAIT",ADRRET="SORTIE^%TLIACTI" D INIT^%ANGEPIL
 I $$OKCOMP^%TLOGCMP(TRT) G SUITCMP
 G SUITNCMP
SORTIE D:KVARLOC KVARLOC
 K ^SAVVAL($J)
 D EPIL^%ANGEPIL,DEP^%SGVAR("MAP")
 Q SORT
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
SUIT G:$$OKCOMP^%TLOGCMP(TRT) SUITCMP
SUITNCMP 
 S CARD=$$^%QSCALVA("L0",LISTE,"CARD") I CARD="" S SORT=3 G @ADRRET
 S ADR=$$^%QSCALVA("L0",LISTE,"ADRESSE") I ADR="" S SORT=3 G @ADRRET
 S LTRI=$$^%QSCALVA("L0",LISTE,"TRIEE")
 S SIND=$S(SELECIN:1,LTRI="":0,1:2)
 S MG=80,MD=45,HH=2,HACT=7
 
 S REPL=$$NOMLOG^%QSF(REP)
 
 S CXT("@","BASE")=REP
 S CXT("%","BASE")="%",CXT("%","OBJET")=$J
 S ABANDON=0,HALT=0,IND="",ITRI="",NBT=0,FIRST=1
 D:MODAF INIT^%TLIFEN,REAF^%TLIFEN
 
BOUCIND 
 I SIND=1 S IND=$O(@SOUSENS@(IND)) G:IND="" BOUCF G TRTIND
 S IND=$$SUIVL^%QS0XG1(LISTE,IND) G:IND="" BOUCF G TRTIND
 
 
 
TRTIND I MODAF=1 D NET^%TLIACT3 I '(FIRST) D CLEAR^%QUPILF("ATT"),CLEAR^%QUPILF("ACT"),CLEAR^%QUPILF("LOG")
 I '($$IR^%QSGE5(REP,IND)) D:MODAF ADD^%TLIFEN("ATT",$$^%QZCHW("Individu inconnu")) G BOUCIND
 S NBT=NBT+1,CXT("@","OBJET")=IND
 S FIRST=0 D:MODAF IND^%TLIACT3,NBT^%TLIACT3
 D:MODAF=0 INDBAS^%TLIACT3 H:MODEX=1 1
 S ORIGINE="TRT"
 S ETIQ="",GLOSTO="^[QUI]TTL("""_TRT_""",2)",RETOURGO="RETGO^%TLIACTI"
 G GO^%TLIACT1
RETGO G:(ABANDON=0)&(HALT=0) BOUCIND
BOUCF D:MODAF END^%TLIFEN I (ABANDON=1)!(HALT=1) S SORT=4 G @ADRRET
 S SORT=0 G @ADRRET
 
 
 
SUITCMP S CARD=$$^%QSCALVA("L0",LISTE,"CARD") I CARD="" S SORT=3 G @ADRRET
 S ADR=$$^%QSCALVA("L0",LISTE,"ADRESSE") I ADR="" S SORT=3 G @ADRRET
 S LTRI=$$^%QSCALVA("L0",LISTE,"TRIEE")
 S SIND=$S(SELECIN:1,LTRI="":0,1:2)
 S MG=80,MD=45,HH=2,HACT=7
 
 S ISCTRLA=^REMANENCE($J,"CTRLA")
 
 S CXT("@","BASE")=REP
 S CXT("%","BASE")="%",CXT("%","OBJET")=$J
 S ABANDON=0,HALT=0,IND="",ITRI=""
 
BOUCI2 I SIND=2 S ITRI=$O(@LTRI@(ITRI)) G:ITRI="" BOUCF S IND=@LTRI@(ITRI) G TRTI2
 I SIND=1 S IND=$O(@SOUSENS@(IND)) G:IND="" BOUCF G TRTI2
 S IND=$O(@ADR@(IND)) G:IND="" BOUCF2
TRTI2 I '($$IR^%QSGE5(REP,IND)) G BOUCI2
 S CXT("@","OBJET")=IND
 S ORIGINE="TRT",ETIQ="",RETOURGO="RETGO2^%TLIACTI"
 G GOCOMPI^%TLIACT0
RETGO2 G:(ABANDON=0)&(HALT=0) BOUCI2
BOUCF2 I (ABANDON=1)!(HALT=1) S SORT=4 G @ADRRET
 S SORT=0 G @ADRRET
 
 
KVARLOC K ^V($J,"%")
KILLVL D SXSPEED^%QSGESTK("%",$J),VRCARD^%QSGESTI("%") Q

