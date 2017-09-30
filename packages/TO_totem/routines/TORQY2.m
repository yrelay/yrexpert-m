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

;TORQY2^INT^1^59547,74875^0
TORQY2(NUFA,TWREF,LISTE,BASI,%CUK,GAM,FILS) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 K ^CONS($J),^DIM($J),^U($J) Q:'($D(@("^[QUI]TREEWORK(NUFA,"_TWREF_")")))  S ARTI=$P(@("^[QUI]TREEWORK(NUFA,"_TWREF_")"),"^",2)
 I '($D(^[QUI]ANTETUDE(ARTI,NUFA,TWREF))) D ^%VZEAVT("Transfert impossible le global ^%ANTETUDE pour l'etude "_%CUK_" n'existe pas") Q
 S REFTOT=$P(^[QUI]ANTETUDE(ARTI,NUFA,TWREF),"^",1)
 S QT=$S($D(^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE"))):^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE")),1:1)
T0 
T01 D MSG^%VZEATT("Affectation des attributs NUMERO.TOTEM et DATE.RECUPERATION.TOTEM")
 D PA^%QSGESTI(BASI,%CUK,"NUMERO.TOTEM",NUFA,1)
 D ZD^%QMDATE4,PA^%QSGESTI(BASI,%CUK,"DATE.RECUPERATION.TOTEM",%DAT,1)
 I (GAM=0)!(FILS=0) D CLEPAG^%VVIDEO,^%VZCD(0,39,0,2,1,0,$$^%QZCHW("TRANSFERT TOTEM --> DKBMS en cours ..")) S PAR="@" G PAR
 
 S BASF=$$REPFIL
 S BASFI=$$NOMINT^%QSF(BASF)
 D MSG^%VZEATT("Suppression des individus fils de "_%CUK_" avant transfert")
 D SUPFILS
 D MSG^%VZEATT("Fin de suppression des individus fils")
 D CLEPAG^%VVIDEO,^%VZCD(0,39,0,2,1,0,$$^%QZCHW("TRANSFERT TOTEM --> DKBMS en cours .."))
DIME 
 S OP="" F DI=1:1 S OP=$O(^[QUI]DIM(NUFA,TWREF,OP)) G:OP="" DUREE D GENERAL S OR="" F D=1:1 S OR=$O(^[QUI]DIM(NUFA,TWREF,OP,OR)) Q:OR=""  D DIM
DUREE 
 S OP="" F DU=1:1 S OP=$O(^[QUI]DUREE(NUFA,TWREF,OP)) G:OP="" CONS D GENERAL,DURE
CONS 
 S OP="" F CS=1:1 S OP=$O(^[QUI]CONS(NUFA,TWREF,OP)) S:OP="" PAR="@" G:OP="" PAR D GENERAL,CONSIG
 
GENERAL 
 S NOR=$P(OP,"/",2)
 S OPE=%CUK_","_OP
 D PA^%QSGESTI(BASFI,OPE,"NOM",OP,1)
 
 D PA^%QSGESTI(BASFI,OPE,$$NOMLOG1^%QSF(BASI),%CUK,NOR)
 D PA^%QSGESTI(BASI,%CUK,$$NOMLOG1^%QSF(BASFI),OP,NOR) Q
DIM S TT=^[QUI]DIM(NUFA,TWREF,OP,OR)
 S VATT=$P(TT,"|",1)_" : "_$P(TT,"|",2)
 D PA^%QSGESTI(BASFI,OPE,"DIMENSION.A.L.OUTIL",VATT,OR) Q
DURE S TT=^[QUI]DUREE(NUFA,TWREF,OP)
 S VATT=$P(TT,"^",1)
 S VATT2=$P(TT,"^",2)
 D PA^%QSGESTI(BASFI,OPE,"TEMPS.PREPARATION",VATT,NOR)
 D PA^%QSGESTI(BASFI,OPE,"TEMPS.FABRICATION",VATT,NOR) Q
CONSIG S VATT=^[QUI]CONS(NUFA,TWREF,OP)
 D PA^%QSGESTI(BASFI,OPE,"CONSIGNE",VATT,NOR) Q
 
PAR S PAR=$O(^[QUI]TVPAR(NUFA,TWREF,PAR)) G:PAR="" FPAR
 D SAH^%QSGESTI(BASI,%CUK,PAR)
 D:$$EXISTE(PAR,.LISTE) PA^%QSGESTI(BASI,%CUK,PAR,^[QUI]TVPAR(NUFA,TWREF,PAR),1)
 G PAR
FPAR D ^%VZEAVT($$^%QZCHW("Transfert de l'etude ")_NUET_$$^%QZCHW(" sur l'individu ")_%CUK_$$^%QZCHW(" terminee")) Q
EXISTE(PAR,LISTE) 
 Q:PAR="" 0
 Q:$$^%QCAZG("LISTE")="*" 1
 Q $D(LISTE(PAR))>0
FIN D END^%QUCHOIP Q
SAISIND(%CUK,ABORT) 
 
 S DX=0,DY=3 X XY D CLEBAS^%VVIDEO
 S DX=5,DY=5 X XY W $$^%QZCHW("Choisir un individu pour transferer l'etude "_NUET)
 S REP=$$LISTIND^%QSGEST6(BASI)
 D INIT^%QUCHOIP(REP,1,"",20,7,30,15),AFF^%QUCHOIP
 S %CUK=$$UN^%QUCHOIP D END^%QUCHOIP I %CUK="" S ABORT=1 Q
 S ABORT=0 Q
REPFIL() N LIENS,LIEN,I,J,PR,DX,REP
 D LIEN^%QSGEST9(BASI,"LIENS")
 S J=$O(INT(""))
 F I=0:0 Q:J=""  K LIENS($$NOMLOG^%QSF(J)) S J=$O(INT(J))
 Q:LIENS=0 ""
 
 S REP="" F I=1:1 S REP=$O(LIENS(REP)) Q:REP=""  K:LIENS(REP)'=2 LIENS(REP)
 Q:$O(LIENS(""))="" ""
 S PR=$O(LIENS("")),DX=$O(LIENS(PR)) Q:DX="" PR
 S LIEN=$$SEL^%QSGEST6("LIENS",$E("QUEL REPERTOIRE LIE A "_$$NOMLOG^%QSF(BASI)_" ?",5,40))
 Q LIEN
SUPFILS 
 D LIENS^%QSGEST9(BASI,%CUK,"GLO")
 S LIEN="" F L=1:1 S LIEN=$O(GLO(LIEN)) Q:LIEN=""  D:GLO(LIEN)=2 FILS
 Q
FILS 
 S FILS="" F F=1:1 S FILS=$O(GLO(LIEN,FILS)) Q:FILS=""  D SUPF
 Q
SUPF 
 S NOMF=$$NOMFILS^%QSGES10(BASI,%CUK,BASFI,GLO(LIEN,FILS))
 D SX^%QSGESTI(BASFI,NOMF) Q

