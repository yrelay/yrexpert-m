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

;TO9EXIM0^INT^1^59547,74871^0
TO9EXIM0 ;
 
DEB S CGRIL="" K ^AVER($I),^AVER2($I) S PGRIL="@TABRA"
 I $D(@TABRA) G EXIS
 I '($D(@TABTV)) S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=$$^%QZCHW("      Parametre IMPLICITE ")_MSG_"  "_$$^%QZCHW("N'a pas ete evalue !") G FINB
 S NBLG=NBLG+1,%CH=$$^%QZCHW(" Valeur : ")_@TABTV,%LGR=35+$L(%CH) D ^%QZCHBK S ^POSENR(DOLARI,NBLG)=%CH S:$D(^[QUI]UNITE(SFA,AVER)) ^POSENR(DOLARI,NBLG)=^POSENR(DOLARI,NBLG)_$$^%QZCHW("    Unite : ")_^[QUI]UNITE(SFA,AVER)
 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="" G FINB
EXIS I $D(@TABRA)=10 S PGRIL="^[QUI]RAISON(NUFA,NSFA,AVER,NEX)"
 S CGRIL="?????",GRIL=@PGRIL,EXPLI="",TGRIL=$P(GRIL,"(",1)
 I (GRIL'["MODIFICATION")&((GRIL'["COPI")&((GRIL'["IMPLICIYST")&(GRIL'["ABAQUE^"))) S NOMTAB=TGRIL D ^%VTNAMFU S:%NFU'="" GRIL=%NFU_"("_$P(GRIL,"(",2,299) S CGRIL=$S($D(@GRIL):@GRIL,1:"?????")
 S MSG=$S(TGRIL["NOME":$$^%QZCHW(" Composant de la NOMENCLATURE "),TGRIL["IMPLICI":$$^%QZCHW(" Parametre IMPLICITE "),TGRIL["PHASE":$$^%QZCHW(" Operation de la GAMME "),TGRIL["MATIERE":$$^%QZCHW("Famille matiere"),TGRIL["SELMA":$$^%QZCHW("Choix matiere en stock"),1:"SUITCH")
 I MSG="SUITCH" S MSG=$S(TGRIL["DIMOUT":$$^%QZCHW("Dimensions a l'outil"),TGRIL["OUTCON":$$^%QZCHW("Consignes-outillage"),TGRIL["ABAQUE^":$$^%QZCHW("Resultat d'abaque"),1:$$^%QZCHW(" Evaluation TEMPS et COUTS "))
 S DC=$S(TGRIL["IMPLI":2,TGRIL["IMPMA":2,TGRIL["NOME":2,1:1) D FINA^TO9EXIMP G:(TGRIL["MODIFIC")!((TGRIL["COPI")!((TGRIL["SYST")!((TGRIL["ABAQUE^")!(CGRIL["?????")))) FINB
 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,%CH=$$^%QZCHW("Selectionne(e) car : "),%LGR=20+$L(%CH) D ^%QZCHBK S ^POSENR(DOLARI,NBLG)=%CH,%CH="..................",%LGR=%LGR-3 D ^%QZCHBK S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=%CH,NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=""
 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="         "
 F CAS=1:1 S ITEM=$P(CGRIL,"^",DC) G:ITEM="" FIN D:((CAS-1)#4)=0 1^TO9EXIM1 D:((CAS-3)#4)=0 2^TO9EXIM1 S:ITEM="[]" ITEM=$$^%QZCHW("compris entre") S ^POSENR(DOLARI,NBLG)=^POSENR(DOLARI,NBLG)_ITEM_$$^%QZCHW(" "),DC=DC+1 I (CAS#4)=0 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="         "
FIN I TGRIL["IMPLICI" S K3=$P(GRIL,"""",6) I K3["(",K3["/",K3[")" S DY=DY+1,NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="     "_$S(CAS=1:"",1:$$^%QZCHW("Et"))_$$^%QZCHW(" triplet Alliage/Etat/Norme = ")_$P($P(K3,"(",2),")",1),DDYY=DY G DOLAV
 S SINON=$S($P(GRIL,$$^%QZCHW("""SINON"""),2)=")":1,1:0) I CAS=1 S ^POSENR(DOLARI,NBLG)=$S(SINON=0:$$^%QZCHW("Acquisition non conditionnee"),1:$$^%QZCHW("Regle ""SINON"" du raisonnement")),NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=""
DOLAV I $D(^AVER($I)) S AVER=^AVER($I) G DEB
 I $D(^AVER2($I)) S NU=-1 F UU=0:0 S NU=$N(^AVER2($I,NU)) Q:NU=-1  S RE=^AVER2($I,NU),AVER=$P(RE,"|",1),CS=$P(RE,"|",2) D ^TO9EXIM2
 G FINB
FINB Q

