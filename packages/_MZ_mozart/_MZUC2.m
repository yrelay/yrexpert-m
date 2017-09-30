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

;%MZUC2^INT^1^59547,73872^0
MOZUC2 ;
 
NFIC S REFUSE=1 Q:RESUL(1)=""  S REFUSE=0,(ONF,NF)=-1 F %U=1:1 S NF=$N(^[QUI]MOZINFO(RESUL(1),NF)) Q:NF=-1  S ONF=NF
 S ICC=IC,TAB(ICC)=$S(ONF=-1:1,1:ONF+1) D ^%VAFFICH K NF,ONF,%U G FIN
FIN K TAB Q
 
TYGA S REFUSE=1,OK=$F("TYMA?",RESUL(IC)) Q:'(OK)  S REFUSE=0 Q:RESUL(IC)'="?"  S REFUSE=1 D CLEPAG^%VVIDEO S DX=0,DY=0 X XY D CUROF^%VVIDEO F DY=1:1:13 X XY D CAG^%VVIDEO
 S DY=2,MSG="Types de Gamme",DX=20-($L(MSG)\2) X XY W MSG S DXG=15,DYH=7,LH=10,LV=4,BLD=1 D CARS^%VVIDEO S DX=0 X XY D REV^%VVIDEO S DXG=16,DYH=8,MSG=" MOZART ",DX=0 X XY D BIG^%VVIDEO,NORM^%VVIDEO
 S DX=0,DY=15 D CLEBAS^%VVIDEO S DXG=10,DYH=14,LH=60,LV=9 D CARS^%VVIDEO
 K ^MOZCH($J) S TBMOV="^MOZCH($J,DY)",MPASX=0,MPASY=1,NXI=9,NXS=60,NYI=15,NXS=20,DX=12,DY=16 F %U=0:1 S LIB=$P($T(TYG+%U),";;",2) Q:LIB=""  X XY W LIB S ^MOZCH($J,DY)=LIB,DY=DY+1
 S PX=12,PY=16
LEC1 S DX=PX,DY=PY X XY
 D ^%VZEREV
 S PX=$X,PY=$Y G:X1'=13 LEC1 G TY16:PY=16
 S CH=$E(^MOZCH($J,PY),1),ICC=IC,TAB(ICC)=CH,OICC=ICC
 D CLEPAG^%VVIDEO,GR^%MZAFIGR,SC^%MZAFIGR
 S (ICC,IC)=OICC,REFUSE=0 D ^%VAFFICH G FIN
TY16 S OICC=IC D CLEPAG^%VVIDEO,GR^%MZAFIGR,SC^%MZAFIGR S ICC=OICC,REFUSE=1 G FIN
TYG ;;Abandon
 ;;T :   texte d'aide a la redaction
 ;;Y :   gamme type
 ;;M :   gamme mere
 ;;A :   gamme affectee et lancee
 ;;
NUG Q
MACH(IC) 
 S PARA=RESUL(IC) D ^%QZCHBT S REFUSE=1
 S TAB(ICC)=PARA D ^%VAFFICH S REFUSE=0
 I $E(PARA,1)="@" S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Un mot ne doit pas commencer par un @")) S PARA=$P(PARA,"@",2) G END
 I $P(PARA,".",1)="" S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Un nom de machine ne doit pas commencer par un point (= Separateur)")) G END
 I PARA["," S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Un nom de machine ne doit pas contenir de virgule ... ")) G END
 G END
OUTIL(IC) 
 S PARA=RESUL(IC) D ^%QZCHBT S REFUSE=1
 S TAB(ICC)=PARA D ^%VAFFICH S REFUSE=0
 I $E(PARA,1)="@" S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Un mot ne doit pas commencer par un @")) S PARA=$P(PARA,"@",2) G END
 I $P(PARA,".",1)="" S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Un nom d'outil ne doit pas commencer par un point (= Separateur)")) G END
 I PARA["," S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Un nom d'outil ne doit pas contenir de virgule ... ")) G END
FAM I RESUL(IC)="" D ^%VZEAVT($$^%QZCHW("Ce champ doit etre rempli ...")) S REFUSE=1 Q
END Q
 
CREAG 
 
 N RPERE,NPERE,RFILS,NFILS,LIENPF,FILS
 I '($$GOOD(RESUL(1))) D:$D(RFILS) SX^%QSGESTK(RFILS,NFILS) S REFGAM=1,ABENDSCR=1 D POCLEPA^%VVIDEO Q
 G:RPERE="" STOG
STOL 
 S LIENPF=$$LIENPF^%QSGEL2(RPERE,RFILS)
 
 D ADDS^%QSGEST3(RPERE,NPERE,LIENPF,RFILS,NFILS)
STOG 
 D PA^%QSGESTI($$GI^%MZQS,NFILS,"NOM",FILS,1) K ^[QUI]MOZGARDE(RESUL(1))
 D ^%VAUTOST,POCLEPA^%VVIDEO
 Q
 
EXPLI 
 N ATT,VAL,LIG
 D:%AJM'="A" PREP
 F %U=3:3:26 S ATT=RESUL(%U),VAL=RESUL(%U+1) D PA^%QSGESTI("POSTE.DE.TRAVAIL",RESUL(1),ATT,VAL,1) K:RESUL(%U)'="" LIG(%U)
 S T="" F %U=0:0 S T=$O(LIG(T)) Q:T=""  S ATT=LIG(T) I ATT'="" D SAH^%QSGESTI("POSTE.DE.TRAVAIL",RESUL(1),ATT)
 D ^%VAUTOST,POCLEPA^%VVIDEO Q
PREP 
 F %U=3:3:26 S LIG(%U)=AFRESU(%U)
 Q
 
SUP() 
 F %U=3:3:26 S ATT=RESUL(%U),VAL=RESUL(%U+1) D PS^%QSGESTI("POSTE.DE.TRAVAIL",RESUL(1),ATT,VAL,1)
 K ^[QUI]PEXPMACH(RESUL(1),RESUL(2))
 Q 1
 
 
 
GOOD(YY) 
 S REFGAM=0
 I $$NOM^%QSGE9($$GI^%MZQS,YY) D ^%VZEAVT($$^%QZCHW("stockage impossible : le nom de la gamme:"_YY_" est mal forme")) Q 0
 S RFILS=$$GI^%MZQS,FILS=$P(YY,",",$L(YY,","))
 S NFILS=YY
 S RPERE=$$RPERE^%QSGES17(RFILS)
 I RPERE="" Q 1
 S NPERE=$$NOMPERE^%QSGES10(RFILS,NFILS)
 I $$IR^%QSGEST5(RPERE,NPERE) Q 1
 D ^%VZEAVT($$^%QZCHW("stockage impossible")_" :"),^%VZEAVT($$^%QZCHW("l'individu ")_NPERE_$$^%QZCHW(" n'existe pas dans le repertoire ")_RPERE)
 I $$MES^%VZEOUI("Voulez-vous creer l'individu "_NPERE_" associe a la gamme ?","N") G CREP
 Q 0
CREP 
 I NPERE="" D ^%VZEAVT($$^%QZCHW("creation impossible : le nom de l'individu "_RPERE_" est indefini")) Q 0
 I $$NOM^%QSGE9(RPERE,NPERE) D ^%VZEAVT($$^%QZCHW("creation impossible : le nom de l'individu "_RPERE_" est mal forme")) Q 0
 D ^%VZEATT,PA^%QSGESTI(RPERE,NPERE,"NOM",NPERE,1) Q 1
KILL 
 K NPERE,RPERE,FILS,NFILS,RFILS Q
 
 
EXIMACH S REFUSE=0
 Q:%AJM="C"
 I %AJM="A" Q:'($D(^[QUI]DESMACH(RESUL(1))))  D ^%VZEAVT($$^%QZCHW("Cette machine existe deja")) S REFUSE=1 Q
 Q:AFRESU(1)=RESUL(1)
 I $D(^[QUI]DESMACH(RESUL(1))) D ^%VZEAVT($$^%QZCHW("Cette machine existe deja")) S REFUSE=1
 Q
SECT S REFUSE=0
 Q:%AJM="C"
 I %AJM="A",RESUL(1)="" D ^%VZEAVT($$^%QZCHW("machine non definie")) S REFUSE=1 Q
 I %AJM="A" Q:'($D(^[QUI]DESMACH(RESUL(1))))  D ^%VZEAVT($$^%QZCHW("Cette machine existe deja")) S REFUSE=1 Q
 Q:(AFRESU(1)=RESUL(1))&(AFRESU(2)=RESUL(2))
 Q:((AD="*MOD")&(AFRESU(1)=RESUL(1)))&(AFRESU(2)'=RESUL(2))
 I $D(^[QUI]DESMACH(RESUL(1))) D ^%VZEAVT($$^%QZCHW("Cette machine existe deja")) S REFUSE=1
 Q

