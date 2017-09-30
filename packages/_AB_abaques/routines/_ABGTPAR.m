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

;%ABGTPAR^INT^1^59547,73864^0
%ABGTPAR ;
 
 S NT="^[QU]STRUCT(NOMG)",DP=@NT@(1,1)
BEG S PVAR=@NT@(1,2)
 S NVC=@NT@(1,3)
 S LCHP=@NT@(1,3,1)
 S TYPV=@NT@(1,4)
 S NBC=@NT@(1,5)
 S (LARCOL,ESPC)=@NT@(1,5,1)
 S LIG3=@NT@(1,5,2)
 S (LIMS,LIG2)=@NT@(1,5,3)
 S PSEP=@NT@(1,6)
END S %DH=0,%DB=0,%PH=PSEP-4,%PB=20-PSEP,NBP=0,NBR=0 D GESCUR S %CP=NBP,%CR=NBR K NBP,NBR I '($D(^CUMUL($I,NOMG))) D CUMUL
FIN Q
GESCUR S (NBP,NBR)=0 K ^DERSAIS($I,NOMG),^NEXSAIS($I,NOMG)
 S NT="^[QU]STRUCT(NOMG,2)" F %VV="P","R" S NB="NB"_%VV,DA=$S(%VV="P":%DH,1:%DB),DB=DA+$S(%VV="P":3,1:PSEP),DC=DB,PL=$S(%VV="P":%PH,1:%PB),FN=PL+DB D GET
 K NT,%VV,DB,DA,DC,FN,PL,NB G FIN
GET F UU=0:0 S DC=$N(@NT@(%VV,DC)) Q:DC=-1  D:DC>FN AJUST S @NB=@NB+1,^DERSAIS($I,NOMG,%VV,-(DA),-(DC-DA))=1,^NEXSAIS($I,NOMG,%VV,DA,DC-DA)=-1
 Q
AJUST S DA=DA+PL,FN=FN+PL Q
CUMUL S NT="^[QU]STRUCT(NOMG,2)" F %VV="P","R" S NBV=0,LIM=@("%C"_%VV),DD=$S(%VV="P":4,1:PSEP+1) F UU=DD:1 Q:NBV'<LIM  D AJCUM
 K UU,DD,NBV,LIM G FIN
AJCUM S ^CUMUL($I,NOMG,%VV,UU-DD)=NBV
 I $D(@NT@(%VV,UU)) S NBV=NBV+1
 G FIN

