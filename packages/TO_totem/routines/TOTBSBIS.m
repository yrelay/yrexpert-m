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

;TOTBSBIS^INT^1^59547,74876^0
TOTBSBIS ;
 
PH S ETD="PHAS" G COPY
CONS S ETD="CONS" G COPY
DIM S ETD="DIM" G COPY
FORM F ETD="FORM","DIM","CONS" D COPYS
 Q
MAC S ETD="SELMAC" G COPYS
COPY S TBT="^[QUI]GLOETUD(YA,ETD,1)",TBN="^GLOETUD($I,NUFA,TWREF,ETD)",NI=-1,NUC=$ZP(@TBN@(""))+1 F %U=1:1 S NI=$N(@TBT@(NI)) Q:NI=-1  S VTB=@TBT@(NI),@TBN@(NUC)=VTB,NUC=NUC+1
 K ETD,TBT,TBN,NI,VTB Q
COPYS S TBT="^[QUI]GLOETUD(YA,ETD)",TBN="^GLOETUD($I,NUFA,TWREF,ETD,%V," F %V=0,1 S NI=-1 F %U=1:1 S NI=$N(@TBT@(%V,NI)) Q:NI=-1  S VTB=@TBT@(%V,NI),TBO=TBN_VTB_")",@TBO=VTB
 K ETD,TBO,TBT,TBN,NI,VTB Q
TPH S TBT="^TENTATIV($I,NUFA,TWREF,""PHAS"")" F ETB="^[QUI]PHASE(YA)","^PHASE($I,NUFA,TWREF,YA)" D TPH1
 G TPH2
TPH1 S PH=-1 F %U=0:0 S PH=$N(@ETB@(PH)) Q:PH=-1  I PH'["~" S OG=-1 F %U=0:0 S OG=$N(@ETB@(PH,OG)) Q:OG=-1  S OP=-1 F %U=0:0 S OP=$N(@ETB@(PH,OG,OP)) Q:OP=-1  S:OP'["~" @TBT@(PH,OP,OG)=$S(ETB["$I":1,1:0)
 Q
TPH2 S ETD="PHAS",TBT="^[QUI]GLOETUD(YA,ETD)",TBN="^GLOETUD($I,NUFA,TWREF,ETD)",V1=-1,NUC=$ZP(@TBN@(""))+1
 F %V=0,1 S NI=-1 F %U=1:1 S NI=$N(@TBT@(%V,NI)) Q:NI=-1  S V1=$S(NI>V1:NI,1:V1),VTB=@TBT@(%V,NI) I ($P(VTB,",",2)'["~")&($P(VTB,",",4)'["~") S @TBN@(%V,NUC)=VTB_"^"_0,NUC=NUC+1
 S TBT="^GLOETUPH($I,NUFA,TWREF,YA,ETD)",TBN="^GLOETUD($I,NUFA,TWREF,ETD)" F %V=0,1 S NI=-1 F %U=1:1 S NI=$N(@TBT@(%V,NI)) Q:NI=-1  S V1=V1+1,VTB=@TBT@(%V,NI),@TBN@(%V,NUC)=VTB_"^"_1,NUC=NUC+1
 K V1,ETB,TBT,PH,OG,OP,%U Q
NOM S TBN="^[QUI]NOMARL(YA)",TBT="^PHASADM($I,NUFA,TWREF,""BISCP"")",NI=-1 F %U=1:1 S NI=$N(@TBN@(NI)) Q:NI=-1  S @TBT@(NI)=@TBN@(NI)
 K TBN,TBT,NI Q

