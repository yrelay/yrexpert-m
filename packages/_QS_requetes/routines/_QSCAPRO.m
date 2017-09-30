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

;%QSCAPRO^INT^1^59547,73880^0
QSCAPRO ;
 
MV(LIEND,BA,OBJ,ATT,TOUS,GLP,TYP) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N I,%I,G2,G1,T1,I,OD,ARRET,OR,REPD,VAL,J,OR2,L,CARD,REPD,PERES,LAST,FISTON
 S G1=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"G1") K @(G1)
 S G2=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"G2") K @(G2)
 I ((BA="")!(OBJ=""))!(ATT="") Q 0
 I LIEND="" D MV^%QSCALVA(BA,OBJ,ATT,.GLP,.TYP) Q 1
 G:$E(LIEND)'="%" SUIT
 S OBJ=$$^%QCAZG("CONT(LIEND,""OBJET"")"),BA=$$^%QCAZG("CONT(LIEND,""BASE"")")
 I ((BA="")!(OBJ=""))!(ATT="") Q 0
 D MV^%QSCALVA(BA,OBJ,ATT,.GLP,.TYP) Q 1
SUIT S REPD=$$^%QCAZG("^[QUI]RQSLIEN(BA,LIEND)")
 Q:REPD="" 0
 S REPD=$P(REPD,"^",2)
 I $$PERE^%QSGES17(REPD,BA)=1 D MV^%QSCALVA(REPD,$$NOMPERES^%QSGES10(OBJ,$$RANG^%QSGES17(REPD)),ATT,.GLP,.TYP) Q 1
 S GLP=0,FISTON=0,VAL="",ARRET=0
 I $$PERE^%QSGES17(BA,REPD)=1 S FISTON=1
 D MVG^%QSCALVA(BA,OBJ,LIEND,G1,.T1)
 I (@G1=0)!(T1=0) S GLP=0 Q 0
 S OR=$O(@G1@("")),GLP=0
 F I=0:0 Q:OR=""  D TB Q:ARRET  S OR=$O(@G1@(OR))
 K @(G1) Q 1
 
TB S OD=@G1@(OR)
 I FISTON S OD=$$NOMFILS^%QSGES10(BA,OBJ,REPD,OD)
 D MVG^%QSCALVA(REPD,OD,ATT,G2,.TYP)
 D STOCK
 S:(GLP'=0)&(TOUS=0) ARRET=1
 K @(G2)
 Q
STOCK S I=""
 F %I=0:0 S I=$O(@G2@(I)) Q:I=-1  S GLP=GLP+1,GLP(GLP)=@G2@(I)
 Q
 
TEST X ^CLAL
 W !,$$MV("CLIENT","COMMANDE","SNECMA,1111","NOM",1,.G1,.T1)
 W !,$$MV("COMMANDE","CLIENT","SNECMA","QUANTITE.A.FABRIQUER",1,.G2,.T2)
 W !,$$MV("COMMANDE","CLIENT","SNECMA","QUANTITE.A.FABRIQUER",0,.G3,.T3)
 Q

