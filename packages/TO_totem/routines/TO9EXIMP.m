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

;TO9EXIMP^INT^1^59547,74871^0
TO9EXIMP ;
 
FINA I TGRIL["ABAQUE^" S COM=$$^%QZCHW("Valeur d'abaque : "),VAL=$S($D(@TABTV):@TABTV,1:"") D E^TO9EXIM1 G FINB
 I TGRIL["IMP" S COM=$$^%QZCHW("Valeur : "),VAL=@TABTV,PFOR=18 D E^TO9EXIM1 G FINB
 I TGRIL["NOMENC" S COM=$$^%QZCHW("Quantite : "),VAL=QTC,PFOR=17 D E^TO9EXIM1 G FINB
 I TGRIL["MATI" S COM=$$^%QZCHW("Famille : "),VAL=^[QUI]TVPAR(NUFA,NSFA,"FAMMAT") D E^TO9EXIM1 G FINB
 I TGRIL["SELM" S COM=$$^%QZCHW("Matiere (Quantite) : "),VAL=^[QUI]TVPAR(NUFA,NSFA,$$^%QZCHW("MATIERE"))_$$^%QZCHW("(Quantite necessaire:")_$P(@("^[QUI]TREEWORK(NUFA,"_NSFA_")"),"^",5)_")",PFOR=17 D E^TO9EXIM1 G FINB
 I TGRIL["OUTCON" S COM=$$^%QZCHW("Consignes-Outillages : "),VAL=^[QUI]CONS(NUFA,NSFA,AAVERR),NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="" D E^TO9EXIM1 G FINB
 I TGRIL["DIMOUT" S COM=$$^%QZCHW("Dimensions a l'outil : "),VAL=VDIM,PFOR=17 D E^TO9EXIM1 G FINB
 I TGRIL'["PH" G FORM
 S COM=$$^%QZCHW("Operation : "),VAL=$P(GRIL,"""",8) S:$D(^[QUI]PHAS(NUFA,NSFA,AVER)) VAL=$P(^[QUI]PHAS(NUFA,NSFA,AVER),"/",1),VAL2=$P(^[QUI]PHAS(NUFA,NSFA,AVER),"/",2) S:(TGRIL["MODIFICATION")!(TGRIL["COPI") VAL=^[QUI]PHAS(NUFA,NSFA,AVER),VAL2=$P(VAL,"/",2) D E^TO9EXIM1
QTCT 
O S AVER=VAL_$S(VAL2="":"",1:"/"_VAL2),NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=$$^%QZCHW("          Temps/Cout de l'operation : ")_$P(AVER,"/",1)
 I $D(@TABRA) S %ERRETUD=0 D ^TO9EXIM0 Q
 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=$$^%QZCHW("Le savoir faire de ")_$P(@("^[QUI]TREEWORK(NUFA,"_NSFA_")"),"^",2)_$$^%QZCHW(" ne permet pas d'evaluer ")
 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=$$^%QZCHW("un temps et un cout de fabrication pour l'operation ")_AVER G CONS
FORM S TPS=^[QUI]DUREE(NUFA,NSFA,AVER),PCH=$P(TPS,"^",1) D TO^%QZNBN1 S TPS1=$S(ISNUM=1:PCH,1:0),PCH=$P(TPS,"^",2) D TO^%QZNBN1 S TPS2=$S(ISNUM=1:PCH,1:0)
 S TPST=TPS1+TPS2,CT=^[QUI]COUT(NUFA,NSFA,AVER),DECIM=$S($D(^TABIDENT(WHOIS,"DECIMALES")):^TABIDENT(WHOIS,"DECIMALES"),1:2)
 S COM=$$^%QZCHW("Fabrication : "),VAL=$$^%QZCHW("Temps = ")_TPST_$$^%QZCHW(" Cout = ")_$J(CT,1,DECIM) K DECIM,CT,TPS,TPS1,TPS2,TPST
 S:(TGRIL'["MODIFICA")&(TGRIL'["COPI") NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=$$^%QZCHW("     Evaluation de la preparation :")_$P(CGRIL,"^",17)_" ("_$E($P(CGRIL,"^",18),1)_")" S PFOR=19 D E^TO9EXIM1
CONS I '($D(^[QUI]CONS(NUFA,NSFA,AVER))) G FINB
 S CG=^[QUI]CONS(NUFA,NSFA,AVER) G:CG["|" MULCO
 S AAVERR=AVER,AVER=^[QUI]CONS(NUFA,NSFA,AVER)_$S($P(AVER,"/",2)="":"",1:"/"_$P(AVER,"/",2)) I $D(@TABRA) K ^AVER($I) S ^AVER($I)=AVER G FINB
 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)="",NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=$$^%QZCHW("Le savoir faire de ")_$P(@("^[QUI]TREEWORK(NUFA,"_NSFA_")"),"^",2)_$$^%QZCHW(" ne permet pas d'affecter ")
 S NBLG=NBLG+1,^POSENR(DOLARI,NBLG)=$$^%QZCHW("de consignes-outillages pour l'operation ")_$P(AVER,"/",1)
 G FINB
MULCO S (AAVERR,OA)=AVER
 K ^AVER2($I) F UU=1:1 S CS=$P(CG,"|",UU) Q:CS=""  S AVER=CS_$S($P(OA,"/",2)="":"",1:"/"_$P(OA,"/",2)) I $D(@TABRA) S ^AVER2($I,UU)=AVER_"|"_CS
 D E^TO9EXIM1
FINB Q

