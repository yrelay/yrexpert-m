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

;%QULELO3^INT^1^59547,73885^0
%QULELO3 ;;02:59 PM  9 Dec 1991;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
LOAD(DEF) N REPE,IND,IN,%I,ORDO,REPD,LINV,REPD,CONFIG,CHC,REP,LARA,TITRE
 K @(GRAC),@(CONF),@(CAR)
 S REPE=$P(DEF,$C(0),1),LIEN=$P(DEF,$C(0),3),IND=$P(DEF,$C(0),5)
 S REP=$$NOMINT^%QSF(REPE),ORDO=0
 I IND="*" S @GRAC="REP^"_IND_"^0",IN="" F %I=1:1 S IN=$$NXTRI^%QSTRUC8(REP,IN) G:IN="" DIAL S @GRAC@(IN)=""
 I $$IR^%QSGE5(REP,IND) S @GRAC="IND^"_IND_"^0",@GRAC@(IND)="" G DIAL
 S @GRAC="LIS^"_IND
 
 
 S ADR=""
 I (ADR=0)!(ADR="") S ADR=$$ADRLIS^%QSGEST7(IND),@GRAC="LIS^"_IND_"^0",IN="" F %I=1:1 S IN=$O(@ADR@(IN)) G:IN="" DIAL S @GRAC@(IN)=""
 S @GRAC="LIS^"_IND_"^1",ORDO=1,IN="" F %I=1:1 S IN=$O(@ADR@(IN)) G:IN="" DIAL S @GRAC@(IN)=@ADR@(IN)
 
DIAL S J=$P(DEF,$C(0),9) I J'="" S @DIAL@("R",REP)=J
 S REPD=$$REPD^%QSGEL2(REP,LIEN)
 S J=$P(DEF,$C(0),11) I J'="",REPD'=REP S @DIAL@("R",REPD)=J
 S J=$P(DEF,$C(0),13) I J'="",$$QUAL^%QSGEL2(REP,LIEN) S @DIAL@("L",LIEN)=J
 S LINV=$$LIENI^%QSGEL2(REP,$$REPD^%QSGEL2(REP,LIEN),LIEN,$$TYPEL^%QSGES90(LIEN))
 S J=$P(DEF,$C(0),15) I J'="",$$QUAL^%QSGEL2(REPD,LINV) S @DIAL@("L",LINV)=J
 S CONFIG=$P(DEF,$C(0),7)
 S @GLOCONF=CONFIG
 S CHC=^[QUI]RQSGLO("QULEL",CONFIG)
 F I=1,4,7 I $P(CHC,"^",I)'="" S @CONF@("COM",$P(CHC,"^",I))=$P(CHC,"^",I+1)_$C(0)_$P(CHC,"^",I+2)
 F I=10,13,16 I $P(CHC,"^",I)'="" S @CONF@("ATT",$P(CHC,"^",I))=$P(CHC,"^",I+1)_$C(0)_$P(CHC,"^",I+2)
 F I=19,22,25 I $P(CHC,"^",I)'="" S @CONF@("LIEN",$P(CHC,"^",I))=$P(CHC,"^",I+1)_$C(0)_$P(CHC,"^",I+2)
 I $P(CHC,"^",29)'="" S @CONF@("POIDS")=$P(CHC,"^",29)
 I $P(CHC,"^",30)'="" S @CONF@("LIEN")=$P(CHC,"^",30)
 I $P(CHC,"^",31)'="" S @CONF@("ORDRE")=$P(CHC,"^",31)
 S LARA=$P(CHC,"^",28)
 S @CAR@("REP")=REP,@CAR@("LIEN")=LIEN,@CAR@("LARA")=LARA
 S @CAR@("ORDO")=ORDO
 S TGR(1)=$P(@GRAC,"^"),TGR(2)=$P(@GRAC,"^",2)
 S TITRE=""
 S TITRE="1"_$C(0)_"2"_$C(0)_$$^%QZCHW("Repertoire ")_$C(0)_1_$C(0)_13_$C(0)_REPE_$C(0)
 S TITRE=TITRE_"1"_$C(0)_"40"_$C(0)_$S(TGR(1)="REP":$$^%QZCHW("Tous les individus"),TGR(1)="IND":$$^%QZCHW("Individu ")_TGR(2),1:$$^%QZCHW("Individus de la liste ")_TGR(2))
 S TITRE=TITRE_$C(0)_"2"_$C(0)_"2"_$C(0)_$$^%QZCHW("Lien ")_LIEN_$C(0)_2_$C(0)_60_$C(0)
 S @CAR@("TITRE")=TITRE
 Q ""
ECHEC Q M
 ;

