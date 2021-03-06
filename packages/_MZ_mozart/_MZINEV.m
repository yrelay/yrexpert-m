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

;%MZINEV^INT^1^59547,73872^0
%MZINEV ;
 
 Q:('($D(^MOZ(WHOIS,"C","PARA"))))&('($D(^MOZ("STAND","C","PARA"))))  K REL,LIS S %YAERR=0,LIT=$S($D(^MOZ(WHOIS,"C","PARA")):^MOZ(WHOIS,"C","PARA"),1:^MOZ("STAND","C","PARA")),OK=1,NI=0 F %U=1:1 S IT=$P(LIT,",",%U) Q:IT=""  S NI=NI+1,LIS(NI)=IT
 N DX,DY
 G:'($D(LIS)) FIN S YYAA=-1 F %U=1:1 S YYAA=$N(^v($I,YYAA)) Q:YYAA=-1  S IITT=-1 F %V=1:1 S IITT=$N(^v($I,YYAA,IITT)) Q:IITT=-1  S V(YYAA,IITT)=^v($I,YYAA,IITT)
 S %W1=$$GI^%MZQS
 S %U="" F %I=1:1 S %U=$$NXTRIA^%QSTRUC8(%W1,PGM,%U) Q:%U=""  S V(YA,%U)=$$^%QSCALVA(%W1,PGM,%U)
 S %W1=NI-1 F %U=1:1:%W1 S IT1=LIS(%U),%W2=%U+1 I $D(V(YA,IT1)),V(YA,IT1)'="" F %V=%W2:1:NI S IT2=LIS(%V) I $D(V(YA,IT2)),V(YA,IT2)'="" S REL(IT1_"."_IT2,1)=V(YA,IT1),REL(IT1_"."_IT2,2)=V(YA,IT2)
 G:'($D(REL)) FIN S RI=-1
LR S RI=$N(REL(RI)) I RI=-1 S OK=1 G FIN
 S IT1=REL(RI,1),IT2=REL(RI,2),T1="^[QUI]MOZREL(RI,IT1,IT2)",T2="^[QUI]CMOZREL(RI,IT1,IT2)",OK=0,NC=-1 G:'($D(@T1)) LR I '($D(@T2)) G FIN
LC S NC=$N(@T1@(NC)) G:NC=-1 FIN G:'($D(@T2@(NC))) FIN S SOURCE=""""_RI_""","""_IT1_""","""_IT2_""","""_NC_"""",PNUM=1,NFOR=0 D RETERR G LR:OK,LC
RETERR S $ZT=^TOZE($I,"MOZEV")
 
NOLO S AT=@T2@(NC),@("OK="_AT)
ROLO S:'(OK) ^REF($J,LIK)=1 S DXG=1,DXD=80,DYH=22,DYB=24 D LWIN^%VVIDEO S DX=0,DY=21 X XY W "Relation : ",RI,!,IT1," - ",IT2,$S(OK:" acceptable",1:" non acceptable") D ^%VSQUEAK
 S DOM=$S($D(^MOZ(WHOIS,"C","PARA")):^MOZ(WHOIS,"C","PARA"),1:^MOZ("STAND","C","PARA"))
 S YYAA=-1 F %UUU=1:1 S YYAA=$N(V(YYAA)) Q:YYAA=-1  S IITT=-1 F %VVV=1:1 S IITT=$N(V(YYAA,IITT)) Q:IITT=-1  D CHA
 Q
FIN O 0 D APPKP^%VVIDEO K DOM,%UUU,%VVV,YYAA,IITT,REL,LIS,LIT,NU,%U,IT,%W1,%W2,%U,%V,T1,T2,NC,PNUM,NFOR,SOURCE,%ERR,AT,RI,IT1,IT2 Q
 Q
CHA F %ZZZ=1:1 S DM=$P(DOM,",",%ZZZ) Q:DM=""  G:DM=IITT FCHA
 I V(YYAA,IITT)'="" S ^v($I,YYAA,IITT)=V(YYAA,IITT)
FCHA Q
ERR S xxx=zzz Q
TEST K V S YA="MOZ",LIT=^MOZ("STAND","C","PARA") F %U=1:1 S IT=$P(LIT,",",%U) Q:IT=""  W !,IT," = " R VIT S V(YA,IT)=VIT
 S LIK=1,PGM="TEST" Q:V(YA,"ACTION")=$C(1)
 D ^%MZINEV W !,!,"Operation ",$S(OK:"",1:"non "),"acceptable",! G TEST

