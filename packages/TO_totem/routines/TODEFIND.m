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

;TODEFIND^INT^1^59547,74871^0
TODEFIND ;
 
BEG S NF=-1,TBPH="^[QUI]PHASADM($I,NUFA,TWREF)"
LPR K LIS S NF=$N(^[QUI]INDICE(YA,"LOCAI",NF)) G:NF=-1 FPR G LPR0:'($D(^PHASADM($I,NUFA,TWREF,"REGINDVU",NF))),LPR0:$D(^PHASADM($I,NUFA,TWREF,"INDISUP","LOCAI",NF)),LPR
LPR0 S IDC=-1,%NU=0 K ^KEY($J)
LIDC S %NU=%NU+1,IDC=$N(^[QUI]INDICE(YA,"LOCAI",NF,IDC)) G:IDC=-1 TR D ^%ABINDIC(IDC,"LIS")
 F %U=1:1 Q:'($D(LIS(%U)))  S IND=LIS(%U) G:'($D(@TBPH@("INDICVU",IND))) LPR S ^KEY($J,IDC,%U)=IND_"^"_$S($D(@TBPH@("INDISUP","LOCAI",NF,IND)):@TBPH@("INDISUP","LOCAI",NF,IND),1:@TBPH@("INDICVU",IND)) K @TBPH@("INDISUP","LOCAI",NF,IND)
TR K LIS S ^PHASADM($I,NUFA,TWREF,"REGINDVU",NF)=1,IND=-1 F %W=1:1 S IND=$N(^KEY($J,IND)) Q:IND=-1  D:IND["~" TV1 D:'($D(^PHASADM($I,NUFA,TWREF,"PINDVU",IND))) TV1
 G TV2
TV1 K VT F %U=1:1 Q:'($D(^KEY($J,IND,%U)))  S VTIL=$P(^KEY($J,IND,%U),"^",2,999) D TR1
 D ^TOGCOMBI("VT",".","^PHASADM($I,NUFA,TWREF,""PINDVU"",IND)") Q
TV2 S DOM=^[QUI]IREPFICH(YA,NF),SIB=$P(DOM,"^",2),DOM=$P(DOM,"^",1),AD=$E(DOM,1,4),NU=-1 D NUS G @AD
LRF 
 ;;-------------- Traitement des domaines   ---------------------------
IMPL S PIND=$P(SIB,"""",2),PIND=$P(PIND,"~",1),NU=-1,(TIL,IND)=$N(^KEY($J,-1)) G:IND=-1 LPR
IMPLL S NU=$N(^PHASADM($I,NUFA,TWREF,"PINDVU",IND,NU)) G:NU=-1 LPR S RF=^PHASADM($I,NUFA,TWREF,"PINDVU",IND,NU),PPI=PIND_"."_RF,^BISIMP($I,NUFA,TWREF,YA,BIS)="!!^"_TIL_"^"_RF_"^"_PPI_"^"_"("""_YA_""","_SIB_")",BIS=BIS+1 G IMPLL
NOME S PIND=$P(SIB,"""",2),PIND=$P(PIND,"~",1),NU=-1,(TIL,IND)=$N(^KEY($J,-1)) G:IND=-1 LPR
NOMEL S NU=$N(^PHASADM($I,NUFA,TWREF,"PINDVU",IND,NU)) G:NU=-1 LPR S RF=^PHASADM($I,NUFA,TWREF,"PINDVU",IND,NU),PPI=PIND_"."_RF,^PHASADM($I,NUFA,TWREF,"BISCP",BISC)="!!^"_TIL_"^"_RF_"^"_PPI_"^"_""""_YA_""","_SIB,BISC=BISC+1 G NOMEL
PHAS D ^TOPHAIND G LPR
 ;;---------------------------------------------------------------------
TR1 G:VTIL[":" TR2 F %V=1:1 S VI=$P(VTIL," ",%V) G:VI="" FTR S VT(%U,VI)=1
TR2 S V1=$P(VTIL,":",1),PA=$P(VTIL,":",2),V2=$P(VTIL,":",3) F %V=V1:PA:V2 S VT(%U,%V)=1
FTR Q
FPR K RFIND,BIS,BISC,%U,IND,VT,POS,NF,DOM,PIND,PPI,TIL,SIB,VTIL,%V,VI,V1,V2,PA Q
NUS S BIS=$ZP(^BISIMP($I,NUFA,TWREF,YA,""))+1,BISC=$ZP(^PHASADM($I,NUFA,TWREF,"BISCP",""))+1,BISPH=$ZP(^GLOETUD($I,NUFA,TWREF,"PHAS",1,""))+1 Q

