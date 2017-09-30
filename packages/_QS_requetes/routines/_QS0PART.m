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

;%QS0PART^INT^1^59547,73879^0
ZLIGPART() 
 
 
 
 
 
 
 
 
 N A,BASE,L,TEST,REP,TEMP,GLO
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S GLO=$$CONCAS^%QZCHAD(TEMP,"GLO")
 S L=$$UN^%QUAPAGM Q:L="" 2
 S BASE=$$^%QSCALVA("L0",L,"OBJET"),REP=$$NOMINT^%QSF(BASE)
ATT D POCLEPA^%VVIDEO S A=$$^%VZAME1("Attribut de regroupement ? ") Q:A="" 2
 I A="?" G LIST
 I '($$AR^%QSGEST5(REP,A)) D ^%VZEAVT($$^%QZCHW("Attribut inconnu pour le repertoire ")_BASE) G ATT
DEB D MSG^%VZEATT($$^%QZCHW("Partitionnement en cours ..."))
 D PART(REP,L,A,GLO)
 D INIT2^%QUAPAGM
 K @(TEMP) Q 2
 
LIST 
 D INIT^%QUCHOIP($$LISTATT2^%QSGEST6(REP),1,"",1,1,79,22),CLEPAG^%VVIDEO,AFF^%QUCHOIP S A=$$UN^%QUCHOIP D END^%QUCHOIP G:A="" ATT G DEB
 
PART(REP,L,A,GL) 
 
 
 
 N SUF,PREF,VAL,NOM,%I,GVAL,TYP,TEMP,IND
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"PART") K @(TEMP)
 S GVAL=$$CONCAS^%QZCHAD(TEMP,"GVAL")
 K ^LISTE($J)
 S PREF=$$^%QSCALVA("L0",L,"ADRESSE")
 S SUF=""
BOUCLE 
 S SUF=$O(@PREF@(SUF))
 I SUF="" K @(TEMP) Q
 K @(GVAL)
 D MVG^%QSCALVA(REP,SUF,A,GVAL,.TYP)
 I @GVAL=0 S VAL="Inconnu" D MAJLIS G BOUCLE
 
 S IND="" F %I=1:1 S IND=$O(@GVAL@(IND)) Q:IND=""  S VAL=@GVAL@(IND) S:VAL="" VAL="Inconnu" D MAJLIS
 G BOUCLE
MAJLIS 
 D LISTE
 D PA^%QSGESTI("L0",NOM,"CARD",$$^%QSCALVA("L0",NOM,"CARD")+1,1)
 S ADRBIS=$$^%QSCALVA("L0",NOM,"ADRESSE")
 S @ADRBIS@(SUF)=""
 
LISTE 
 
 I '($D(^LISTE($J,VAL))) D GENLIS S ^LISTE($J,VAL)=NOM,@GL@(VAL)=NOM D CRELIS
 S NOM=^LISTE($J,VAL) Q
GENLIS 
 S NOM=$$GEN^%QCAPOP("PAR")
 Q
CRELIS 
 D PA^%QSGESTI("L0",NOM,"ADRESSE","^[QUI]PART("""_NOM_""")",1)
 D PA^%QSGESTI("L0",NOM,"NOM",NOM,1)
 D PA^%QSGESTI("L0",NOM,"AUTEUR",WHOIS,1)
 D PA^%QSGESTI("L0",NOM,"LOCALISATION",$I,1)
 D PA^%QSGESTI("L0",NOM,"CARD",0,1)
 D PA^%QSGESTI("L0",NOM,"BASE",REP,1)
 D PA^%QSGESTI("L0",NOM,"OBJET",BASE,1)
 D PA^%QSGESTI("L0",NOM,"SOURCE","PARTITION",1)
 D PA^%QSGESTI("L0",NOM,"CREATION",$H,1)
 D PA^%QSGESTI("L0",NOM,"DATE.CREATION",$$DATE^%QMDATE,1)
 D PA^%QSGESTI("L0",NOM,"HEURE.CREATION",$$HEURE^%QMDATE,1)
 D PA^%QSGESTI("L0",NOM,"AUTRE",L_"/"_$TR(A,".","_")_"="_VAL,1)
 D PA^%QSGESTI("L0",NOM,"ATTRIBUT.ECLATEMENT",A,1)
 D PA^%QSGESTI("L0",NOM,"VALEUR.ECLATEMENT",VAL,1)
 Q
 
TEST 
 N L,A,BASE,REP,GL
 S GL="^ESSAI($J)"
 W ! S L=$$^%VZAME1("Liste de depart :") Q:L=""
 S BASE=$$^%QSCALVA("L0",L,"OBJET"),REP=$$NOMINT^%QSF(BASE)
 W ! S A=$$^%VZAME1("Attribut de regroupement :") Q:A=""
 D PART(REP,L,A,GL) Q

