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

;TORQY7^INT^1^59547,74875^0
TORQY7(NU) 
 
 
 
 
 
 N RESUL,SCR,NOMTAB,%V,TYPE,GLIND,IND,REP,REPF,GAMM,ORD,I,RI,TOTAL,CREA,NOMENC
 N II,OR
 S RI=$$RI^TORQXIN,GAMM=$$^%QSCALVA(RI,NU,"GAMME"),NOMENC=$$^%QSCALVA(RI,NU,"NOMENCLATURE")
 S SCR="TORQY2",NOMTAB=^%SCRE(SCR,"GLOSTOC"),%V=^%SCRE(SCR)
 
 D MV^%QSCALVA(RI,NU,"INDIVIDU.RECEPTEUR",.GLIND,.TYPE)
 K ^TORQY
 S ORD="" F I=1:1 S ORD=$O(GLIND(ORD)) Q:ORD=""  D TRAIT
 N A,Z D ^%VCMS(SCR)
 D PSV^%QSGESTI(RI,NU,"INDIVIDU.RECEPTEUR")
 
 D PSV^%QSGESTI(RI,NU,"REPERTOIRE.RECEPTEUR")
 D PSV^%QSGESTI(RI,NU,"REPERTOIRE.RECEPTEUR.NOMEMCLATURE")
 D PSV^%QSGESTI(RI,NU,"REPERTOIRE.RECEPTEUR.GAMME")
 D PSV^%QSGESTI(RI,NU,"REPERTOIRE.RECEPTEUR.OPERATION")
 D PSV^%QSGESTI(RI,NU,"RESPECT.NOMENCLATURE.EXISTANTE")
 S REP="",OR=1 F I=1:1 S REP=$O(^TORQY(NU,REP)) Q:REP=""  D TRAIT2
 K RESUL,AFRESU,PATOUCH,OR,m,NOMTAB
 Q
TRAIT 
 N VAL
 S VAL=GAMM_"^"_$$^%QSCALIN(RI,NU,"REPERTOIRE.RECEPTEUR.OPERATION",ORD)_"^"_NOMENC_"^"_$$^%QSCALIN(RI,NU,"NOMENCLATURE.LIEN",ORD)_"^"_$$^%QSCALIN(RI,NU,"REPERTOIRE.RECEPTEUR.NOMENCLATURE",ORD)_"^"
 S VAL=VAL_$$^%QSCALIN(RI,NU,"REPERTOIRE.RECEPTEUR.GAMME",ORD)_"^"_$$^%QSCALIN(RI,NU,"RESPECT.NOMENCLATURE.EXISTANTE",ORD)_"^"
 S ^TORQY(NU,$$^%QSCALIN(RI,NU,"REPERTOIRE.RECEPTEUR",ORD),GLIND(ORD))=VAL
 Q
TRAIT2 
 S IND="" F II=1:1 S IND=$O(^TORQY(NU,REP,IND)) Q:IND=""  D TR2
 Q
TR2 D PA^%QSGESTI(RI,NU,"REPERTOIRE.RECEPTEUR",REP,OR)
 D PA^%QSGESTI(RI,NU,"INDIVIDU.RECEPTEUR",IND,OR)
 S TOTAL=^TORQY(NU,REP,IND)
 D PA^%QSGESTI(RI,NU,"REPERTOIRE.RECEPTEUR.OPERATION",$P(TOTAL,"^",2),OR)
 D PA^%QSGESTI(RI,NU,"NOMENCLATURE",$P(TOTAL,"^",3),OR)
 D PA^%QSGESTI(RI,NU,"NOMENCLATURE.LIEN",$P(TOTAL,"^",4),OR)
 D PA^%QSGESTI(RI,NU,"REPERTOIRE.RECEPTEUR.NOMENCLATURE",$P(TOTAL,"^",5),OR)
 D PA^%QSGESTI(RI,NU,"REPERTOIRE.RECEPTEUR.GAMME",$P(TOTAL,"^",6),OR)
 D PA^%QSGESTI(RI,NU,"RESPECT.NOMENCLATURE.EXISTANTE",$S($P(TOTAL,"^",7)'="":$P(TOTAL,"^",7),1:"OUI"),OR)
 S OR=OR+1 Q
NUM(RES) 
 
 S REFUSE=0
 I $$^%QSCALVA(RI,NU,"STATUS")="PB" D ^%VZEAVT($$^%QZCHW("Attention l'etude Totem ")_NU_$$^%QZCHW(" ne s'est pas deroulee correctement. Impossible a transferer")) S REFUSE=1 Q
 S TWREF=$$^%QSCALVA(RI,NU,"COMPOSANTS.ETUDE")
 I TWREF="" D ^%VZEAVT($$^%QZCHW("Transfert impossible de l'etude ")_NU_$$^%QZCHW(" l'attribut COMPOSANTS.ETUDE n'existe pas")) S REFUSE=1 Q
 I '($D(@("^[QUI]TREEWORK(NU,"_TWREF_")"))) D ^%VZEAVT($$^%QZCHW("Transfert impossible de l'etude ")_NU) K @LISTE@(NU) Q
 S ARTI=$P(@("^[QUI]TREEWORK(NU,"_TWREF_")"),"^",2)
 I '($D(^[QUI]ANTETUDE(ARTI,NU,TWREF))) D ^%VZEAVT("Transfert impossible de l'etude "_%CUK) K @LISTE@(NU) Q
 I RES'=NU D ^%VZEAVT($$^%QZCHW("Il est interdit de modifier la valeur de ce champ")) S (RESUL(IC),TAB(IC))=NU,ICC=IC D ^%VAFFICH Q
 Q
REP(RES) 
 S REFUSE=0
 I '($$REP^%QSGEST5($$NOMINT^%QSF(RES))) D ^%VZEAVT($$^%QZCHW("repertoire inconnu")) S REFUSE=1 Q
 Q
 
IND(RES) 
 S REFUSE=0
 I $E(RES,1)="?" D LISTIND^%VYREP($$NOMINT^%QSF(RESUL(IC-1))) I (RESUL(IC)="")!(RESUL(IC)="?") S REFUSE=1 D ^%VAFFICH Q
 I '($$IR^%QSGEST5($$NOMINT^%QSF(RESUL(IC-1)),RES)) S DX=0,DY=23 X XY D ^%VZEAVT(RES_" : "_$$^%QZCHW("individu inconnu")) S REFUSE=1 Q
 Q
INDV 
 S REFUSE=1 D ^%VZEAVT($$^%QZCHW("L'individu ")_RES_$$^%QZCHW(" est deja affecte d'une etude ")_NUM)
 S CH=$$CONFIRM^%VZEOUI($$^%QZCHW("Persistez-vous")_" ?") Q:CH=1
 K @SELEC@(NUM) S REFUSE=1 Q
 Q
 
CREER 
 D MSG^%VZEATT($$^%QZCHW("Ok creation en cours ...")_RES)
 D PA^%QSGESTI($$NOMINT^%QSF(RESUL(IC-1)),RES,"NOM",RES)
 D ^%VZEAVT($$^%QZCHW("L'individu ")_RES_$$^%QZCHW(" est cree"))
 Q
NCREER 
 S REFUSE=1 Q
 
REPF(RES) 
 
 N RES2
 S REFUSE=0 Q:(RESUL(IC-1)=0)&(RES="")
 I (RESUL(IC-1)=0)&(RES'="") D ^%VZEAVT($$^%QZCHW("Aucune gamme ne sera tranferer : repertoire fils inutile")) S REFUSE=1 Q
 I RESUL(IC+4)="" D ^%VZEAVT($$^%QZCHW("Veuillez definir le repertoire des gammes")) S REFUSE=1 Q
 I $E(RES,1)="?" S RESUL(IC)=$$REPFIL^TORQY5($$NOMINT^%QSF(RESUL(IC+4))) S:RESUL(IC)="" REFUSE=1 S TAB(IC)=RESUL(IC),ICC=IC D ^%VAFIGRI,^%VAFISCR,^%VAFFICH Q
 I '($$REP^%QSGEST5($$NOMINT^%QSF(RES))) D ^%VZEAVT($$^%QZCHW("Attention ce repertoire n'existe pas")) S REFUSE=1 Q
 S RES2=$$NOMINT^%QSF(RESUL(IC+4))
 I $D(^[QUI]RQSILIEN(RES2,$$NOMINT^%QSF(RES)))'=10 D ^%VZEAVT(RES_" "_$$^%QZCHW("n'est pas un repertoire fils de ")_RESUL(IC+4)) S REFUSE=1 Q
 I $O(^[QUI]RQSILIEN(RES2,$$NOMINT^%QSF(RES),""))'=2 D ^%VZEAVT(RES_" "_$$^%QZCHW("n'est pas un repertoire fils de ")_RESUL(IC+4)) S REFUSE=1
 Q
 
GAMME(RES) 
 G GAMME^TORQY71
NOMENC(RES) 
 G NOMENC^TORQY71
 
LIEN(IC) 
 G LIEN^TORQY71
REPG(IC) 
 G REPG^TORQY71
RRN(IC) 
 G RRN^TORQY71

