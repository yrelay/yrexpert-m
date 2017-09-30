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

;%MZGABR^INT^1^59547,73871^0
MOZGABR ;
 
 S (YART,WB1)=ARTI,TBA="^[QUI]MOZREL(WB1)",WB2=-1
L1 S WB2=$N(@TBA@(WB2)) G:WB2=-1 FIN S WB3=-1
L2 S WB3=$N(@TBA@(WB2,WB3)) G:WB3=-1 L1 S WB4=-1
L3 S WB4=$N(@TBA@(WB2,WB3,WB4)) G:WB4=-1 L2 D RECON G L3
FIN K %RL,CB,CD,CL,CONDI,CONTAB,EX,FFF,ISNUM,LDP,NTAB,RZZ,TACT,TCOND,WB3,WC,WPR,WUU,WVP,XDP,XLAX Q
RECON S TCOND="^[QUI]CMOZREL(WB1,WB2,WB3,WB4)",CONTAB=@TBA@(WB2,WB3,WB4),CD=PNUM,CONDI=""
LOOP S %PCH=$P(CONTAB,"^",CD) I %PCH["'" D ^TO3LATER G INCR
 G:%PCH="" SUIT D ^%QZNBN1 G:ISNUM=1 INCR
 I '($D(^[QUI]FULL("MOZ",%PCH))) S ^[QUI]UNKN(WB1,%PCH,$E(%PCH,1,2)_$R(10000))=WB1_" "_WB2_" "_WB3_" "_WB4
 S PCHCOMP=%PCH
CONDIT S %RL=0,XLAX=0 D ^%MZCONDI
INCR S CD=CD+4 G:CD>(PNUM+12) SUIT G LOOP
SUIT W "*"
 S @TCOND=CONDI I CONDI="" S @TCOND=1
 S %LCH=$S($D(^TOZE("LIM")):^TOZE("LIM"),1:180) I $L(CONDI)>%LCH S %NU="""C""",XDP=CONDI D ^TOCHEXPR
FINI K AEXEC,IE,IT,ITS,LEX,T,VPOL,WW,LOCA Q

