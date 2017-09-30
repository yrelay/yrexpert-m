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

;TO3TGRIL^INT^1^59547,74870^0
TO3TGRIL ;
 
EXIS I $D(^[QUI]RAISON(NUFA,NSFA,AVER))=10 D L^TO3VSFSU S PGRIL="^[QUI]RAISON(NUFA,NSFA,AVER,NEX)"
 S GRIL=@PGRIL,EXPLI="",TGRIL=$P(GRIL,"(",1) I GRIL["|" S SSET=$P(GRIL,"|",1),SNUFA=NUFA,NUFA=SSET,GRIL=$P(GRIL,"|",2)
 S CGRIL="?????"
 I (GRIL'["MODIFICATION")&((GRIL'["COPI")&((GRIL'["IMPLICIYST")&(GRIL'["ABAQUE^"))) S NOMTAB=TGRIL D ^%VTNAMFU S:%NFU'="" GRIL=%NFU_"("_$P(GRIL,"(",2,299) S CGRIL=$S($D(@GRIL):@GRIL,1:"?????")
 S MSG=$S(TGRIL["NOME":$$^%QZCHW(" Composant de la NOMENCLATURE "),TGRIL["IMPLICI":$$^%QZCHW(" Parametre IMPLICITE "),TGRIL["PHASE":$$^%QZCHW(" Operation de la GAMME "),TGRIL[$$^%QZCHW("MATIERE"):$$^%QZCHW("Famille matiere"),TGRIL["SELMA":$$^%QZCHW("Choix matiere en stock"),1:"SUITCH")
 I MSG="SUITCH" S MSG=$S(TGRIL["DIMOUT":$$^%QZCHW("Dimensions a l'outil"),TGRIL["OUTCONS":$$^%QZCHW(" Consignes-outillages "),TGRIL["ABAQUE^":$$^%QZCHW("Resultat d'abaque"),TGRIL["IMPMAT":$$^%QZCHW("Parametre IMPLICITE"),1:$$^%QZCHW(" Evaluation TEMPS et COUTS "))
 S DX=5,DY=5,DC=$S(TGRIL["IMPLI":2,TGRIL["IMPMA":2,TGRIL["NOME":2,1:1) D INVDEO^%VZEAVT I (TGRIL["MODIFIC")!((TGRIL["COPI")!((TGRIL["SYST")!((TGRIL["ABAQUE^")!(CGRIL["?????")))) S FINA=1 G FIN
 S DY=15,DX=5 X XY W $$^%QZCHW("Selectionne car : ") S DX=10,DY=DY+2 X XY F CAS=1:1 S ITEM=$P(CGRIL,"^",DC) G:ITEM="" FIN D:((CAS-1)#4)=0 1^TO3VSFSU D:((CAS-3)#4)=0 2^TO3VSFSU S:ITEM="[]" ITEM=$$^%QZCHW("compris entre") W ITEM_$$^%QZCHW(" ") S DC=DC+1 I (CAS#4)=0 S DY=DY+1 X XY
FIN Q

