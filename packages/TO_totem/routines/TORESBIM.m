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

;TORESBIM^INT^1^59547,74875^0
TORESBIM ;;03:56 PM  1 Jun 1989
 
 
 
 
 
 
 
 K ^PILBLOC($I)
 S NRO=0,QUW=QUI,(NBI,BI)=ARTI,(NUM,GP)=-1
 S VAL="" D @ADSTO S VAL="     Blocs implicites de "_ARTI_" :" D @ADSTO S VAL="" D @ADSTO
TR I '($D(^[QUW]BLOCIMPL(NBI,"%SGR"))) D DEPIL G:NRO<0 FIN
 G TR1
TR0 S GP=$N(^[QUW]BLOCIMPL(NBI,"%SGR",GP)) I GP=-1 D DEPIL G:NRO<0 FIN
TR1 S NUM=$N(^[QUW]BLOCIMPL(NBI,"%SGR",GP,NUM)) G:NUM=-1 TR0
TR2 D STOPIL S BI=^[QUW]BLOCIMPL(NBI,"%SGR",GP,NUM),BI=$P(BI,"|",2),BLIM="^[QUW]BLOCIMPL("_BI_",0)",BIC=@BLIM,QUW=$P(BIC,"|",3),USR=$P(BIC,"|",4),NBI=$P(BIC,"|",2),(GP,NUM)=-1 D TRBI
 G TR
 
FIN K NRO,QUW,BI,GP,NUM,VAL,OBI,USR,PLC,%IT,%VV,PIL,CLE,PLDIS,NBLK,DEP,FIN,%WW
 Q
STOPIL S NRO=NRO+1,^PILBLOC($I,NRO)=QUW_"^"_NBI_"^"_GP_"^"_NUM Q
DEPIL I NRO=0 S NRO=-1 Q
 S PIL=^PILBLOC($I,NRO),PLC=1 F %IT="QUW","NBI","GP","NUM" S @%IT=$P(PIL,"^",PLC),PLC=PLC+1
 S NRO=NRO-1 Q
TRBI S:USR="" USR="   " S VAL="" F %VV=1:1:NRO S VAL=VAL_" "
 S VAL=VAL_USR_" ==> "_NBI D @ADSTO Q
 
 
 
PHAS S QUW=QUI,NBI=ARTI
 S VAL="" D @ADSTO S VAL="     Blocs phases de "_ARTI_" :" D @ADSTO S VAL="" D @ADSTO
 I '($D(^[QUW]BLOCPHAS(NBI))) G FINP
 S PH=""
TP0 S PH=$O(^[QUW]BLOCPHAS(NBI,PH)) I PH="" G FINP
 I PH=NBI G TP0
 S VAL="     ==> "_PH D @ADSTO
 G TP0
 
FINP K NBI,PH,QUW,VAL Q

