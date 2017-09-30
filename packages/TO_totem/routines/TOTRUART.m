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

;TOTRUART^INT^1^59547,74876^0
TOTRUART ;
 
 S NXI=-1,NXS=75,NYI=7,NYS=22,MPASX=0,MPASY=1,%77L=7
LEC D L7^%QSLIB
 S DX=0,DY=%77L+1 X XY S %77PPP="" D ^%VZECUR G:(X1=1)!((X1=6)!(X1=13)) FIN S:%77PPP="" PX=$X,PY=$Y G:(%77PPP="")&('($D(^POSENR($I,PAGE,PY)))) LEC W $C(X1)
 S ONB=$P(^POSENR($I,PAGE,PY),"^",1),RAP=$P(^POSENR($I,PAGE,PY),"^",2),NUMUS=$P(^POSENR($I,PAGE,PY),"^",3),YG=$C(X1)_$E(ONB,2,8),DX=$X X XY S PCX=$X-1,PCY=$Y D BEG^%VLEC I (CTRLA=1)!(CTRLF=1) S %77PPP="" G FIN
 S %77L=$Y,PCH=Y1 D TO^%QZNBN1 S NBU=PCH I '(ISNUM) S NBU=ONB,DX=0,DY=%77L W "        "
 S DX=0,DY=%77L X XY W NBU S $P(^POSENR($I,PAGE,PY),"^",1)=NBU,^NBUSART($I,NUMUS,RAP)=NBU G LEC
FIN K PCH,NXI,NXS,NYI,NYS,MPASX,MPASY,X1,%77L,YG,Y1,PCX,PCY,NBU,NUMUS,RAP,%77PPP,ONB Q

