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

;%QNEQPRS^INT^1^59547,73879^0
%QNEQPRS ;
 
 
 
 
 
 
 N %E,A,TRT,CTR,ET,ETU,LETU,NOMEN,NL,CARD
ASK D AFF2
 S TRT="YXP.EQX.IMP.ETUDE"
 D POCLEPA^%VVIDEO
 S TRT=$$DATA^%VZAME1($$^%QZCHW("Traitement d'impression")_" ? ",TRT)
 Q:TRT=""
 G:TRT'="?" CONT
 D INIT^%QUCHOIP("^[QUI]TTL",1,"",0,2,80,20),AFF^%QUCHOIP
 S TRT=$$UN^%QUCHOIP D END^%QUCHOIP
 Q:TRT=""
CONT 
 I '($$EXISTE^%TLINTER(TRT)) D ^%VZEAVT($$^%QZCHW("Le traitement")_" "_TRT_" "_$$^%QZCHW("est inconnu")) G ASK
 S ETU=$$REP^%QNEQETU
 S LETU=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LETU") K @(LETU)
 
DEB 
 D AFF
 
 
 S CTR=$$HELP^%QNEQET2(LETU,1)
 
 I (CTR="A")!('($D(@LETU))) G ASK
 
 S ET=""
 F %E=0:0 S ET=$O(@LETU@(ET)) Q:ET=""  D TESMAJ
 I '($D(@LETU)) G DEB
 
 S NL=$$NOM^%QSGES11("TMP")
 D COPY^%QSGES11(NL,ETU,.CARD,LETU)
 D CREER^%QSGES11(ETU,NL,"TMP",CARD,"SELETU","","")
 
 D MSG^%VZEATT($$^%QZCHW("Impression en cours"))
 S A=$$ACTIVL^%TLIACTI(TRT,NL,0,0)
 
 D DEL^%QSGES11(NL)
 G ASK
 
AFF D REAFF^%QNEQACT("Impression")
 Q
 
TESMAJ 
 I $$TEST($$^%QSCALVA(ETU,ET,"NOM.GAMME"),$$^%QSCALVA(ETU,ET,"LISTE.OPERATIONS.GAMME"),$$^%QSCALVA(ETU,ET,"LISTE.POSTES"))=0 K @LETU@(ET) Q
 
 
 Q
 
 
 
PRINT 
 N MODE,CTR,ETUDE,RESUL,PORT,TERM
 S MODE=$$^%QZCHW("impression")
 D REAFF^%QNEQACT(MODE)
 S PORT=$$TABID^%INCOIN("TABTRA")
 S TERM=$$TABID^%INCOIN("TYPTAB")
 I (TERM="")!(PORT="") D ^%VZEAVT($$^%QZCHW("votre imprimante n'est pas definie, veuillez consulter la table d'identification de votre service")) Q
 D LIRE2^%VREAD($$^%QZCHW("Etude")_" : ","",1,RM-1,DY+1,DY-1,"REAFF^%QNEQACT("""_MODE_""")","$$UC^%QNEQACT",.CTR,.ETUDE)
 I (CTR="A")!(ETUDE="") Q
 D REAFF^%QNEQACT(MODE)
 
 I '($$CR(.RESUL)) Q
 D IMPR(ETUDE,RESUL(1),RESUL(2),RESUL(3))
 K RESUL
 D MSG^%VZEATT($$^%QZCHW("Impression en cours"))
 D ^%QNEQPR1(ETUDE,PORT,TERM)
 Q
 
 
 
CR(RESUL) 
 N CTR,MSG,GAM,LIS
 D AFF1^%VACTGRQ("QNEQPR",.RESUL,.CTR)
 I CTR="A" Q 0
 Q 1
 
IMPR(ETU,ENT,NOMEN,OUT) 
 N RETU
 S RETU=$$REP^%QNEQETU
 D PA^%QSGESTI(RETU,ETU,"IMPRESSION.AVEC.NOMENCLATURE",NOMEN,1)
 D PA^%QSGESTI(RETU,ETU,"IMPRESSION.AVEC.OUTILLAGE",OUT,1)
 D PA^%QSGESTI(RETU,ETU,"ENTREPRISE",ENT,1)
 Q
 
TEST(GAM,LISTIND,LLISTEN) 
 I (GAM="")&(LISTIND="") D ^%VZEAVT(ETU_" "_$$^%QZCHW("ne contient ni nom.gamme ni liste.operations.gamme")) Q 0
 I LLISTEN="" D ^%VZEAVT(ETU_" "_$$^%QZCHW("n'a jamais ete equilibree")) Q 0
 Q 1
 
AFF2 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Impression utilisateur d'etudes"),0)
 Q

