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

;%MZWORD^INT^1^59547,73872^0
MOZWORD ;;10:20 AM  20 Jun 1996
 
S S TBFIG($P($ZPOS,"^",2),1)="MOZ" D ^%VZCFIG S $ZT="",%P=16,EDOV=0,EDSL=19,%ALM=0,(EDBB,EDBE,EDST,EDS2,EDDC,EDDW,EDDL)="",$P(%ED,"^",1)=%EDE,%RENUM=0 D INIT^%MZINSF,CLEPAG^%VVIDEO,LOAD
 K ^MOZSAVU($J) S NOMTREE="^U("_$J,%TREECOP="^MOZSAVU("_$J D ^%QCAGLC
ED K ^v($I) D SET^%MZINSF,^%MZED
 K ^v($I),%LUBAT,PGM,%ALM,%SEP,%EDE,%EDI,X,ED,EDBB,EDBE,EDL,EDOV,EDP,EDPP,EDR,EDRP,EDS,EDS2,EDSL,EDST,EDFL,EDCL,EDLL,EDN,WORS,EDDC,EDDW,EDDL D Q^%MZINSF Q
 
LOAD S WORS=0 G LE:PGM=EMP
 S @%TT@($J,"P",0)=$P($T(0),";;",2,999)
LOAD1 X @%TT@($J,"P",0) K Y D:PGM'="" SAV^%MZATTOP(PGM)
LE D STAT Q
 
SAV D:PGM=EMP FILE Q:PGM=EMP  S DX=0,DY=EDSL+2,WORS=0
 D ^%VCRIFLD($$^%QZCHW("Sauvegarde de")_" "_PGM,1,21,0,22)
 S @%TT@($J,"P",0)=$P($T(1),";;",2,999)
 K (%LUBAT,%TT,%PROGEX,RM,QUI,WHOIS,EDP,EDRP,EDL,ED,EDS,EDCL,EDFL,EDLL,WORS,PGM,%P,EDOV,EDSL,EDBB,EDBE,EDST,EDS2,EDDC,EDDW,EDDL,%ED,%EDE,HOST,%AJM,SUB,%RENUM)
 D VARSYS^%QCSAP
 X @%TT@($J,"P",0)
 D CURRENT^%IS,^%VCRIFLD($J("",42),1,21,0,22),^%VCRIFLD($$^%QZCHW("Un instant")_"...",1,21,0,22)
 D RES^%MZATTOP(PGM),INIT^%MZINSF,SET^%MZINSF,STAT,^%VCRIFLD($J("",$L($$^%QZCHW("Un instant")_"...")),1,21,0,22)
 Q
FILE S:'($D(%SA)) %SA=0 S %SAVE="X;%ED" D PUSH^%MZSTK S:'($D(%EDI)) %EDI=12 S $P(%ED,U,1)=%EDI D SET^%MZINSF S %Q="Gamme ? ",X=PGM D ^%MZIN S PGM=$S(^MOZED($J):EMP,1:X),WORS=EMP D POP^%MZSTK,SET^%MZINSF,STAT Q:PGM=""
 G:%SA=1 LOAD4 K ^RESMEM($J) S LI=^%SCRE("MOZGRIL") G:$D(^[QUI]MOZGRIL(PGM)) LOAD2 F I=3:1:LI S ^RESMEM($J,I)=""
 S ^RESMEM($J,1)=PGM D ZD^%QMDATE4,^%QMDAK0 S ^RESMEM($J,2)=%DAT_" a "_HEURE K HEURE,LI G LOAD4
LOAD2 I $D(^[QUI]MOZGRIL(PGM))=10 S %NOM="^[QUI]MOZGRIL(PGM)" D ^%VKMULNG G LOAD3
 S RS=^[QUI]MOZGRIL(PGM) D ^MULTCOURT
LOAD3 K ^RESMEM($J) S ^RESMEM($J,1)=PGM F I=2:1:LI S ^RESMEM($J,I)=$S($D(%RS(I-1)):%RS(I-1),1:"")
LOAD4 S %SA=0 Q
STAT S %ALM=0,$P(%ED,U,3)=$P(^MOZ("C",+(%ED),0),U,1)_" *** Gamme "_PGM_" *** "_$S(EDOV:"Ecrasement",1:EMP)
STAT1 S %FIG="MOZ" X XY D BLD^%VVIDEO,DES^%VZCFIG,NORM^%VVIDEO,AFGA(PGM) S DX=66,DY=21 X XY W $E($$^%QZCHW("colonne"),1,3) S DX=73 X XY W $E($$^%QZCHW("ligne"),1,3) X ^MOZ("C",+(%ED),1,11,1) O $I Q
 
0 ;;D ^%VTIME D ^%MZS02(PGM) D FIN^%VTIME S ^MOZDUR($J)=DUREE 
1 ;;D ^%MZMAJ(PGM) 
 
E S DX=0,DY=EDSL+3 X XY D ^%VSQUEAK W "?File not found ",$ZE X XL S $ZT="E^%MZWORD",PGM="" D FILE,LOAD G ED
AFGA(M) 
 S M=M_" ("_$$GE^%MZQS_")",BL=$J("",(42-$L(M))\2)_M,BL=BL_$J("",42-$L(BL))
 W $$XY^%VVIDEO1(0,0),$$BLD^%VVIDEO1,$$REV^%VVIDEO1,$$^%VCADFLD($J("",18)_"Gamme"_$J("",19)_BL,23,21,22,65),$$NORM^%VVIDEO1 Q
MOZ ;;~L~H~21~1~20/~L~H~42~23~20/~L~H~13~66~20/~L~H~21~1~23/~L~H~42~23~23/~L~H~13~66~23/~L~V~2~0~21/~L~V~2~22~21/~L~V~2~65~21/~L~V~2~79~21/~KS~l~0~20/~KS~m~0~23/~KS~w~22~20/~KS~v~22~23/~KS~w~65~20/~KS~v~65~23/~KS~k~79~20/~KS~j~79~23/
 ;;

