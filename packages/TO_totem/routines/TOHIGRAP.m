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

;TOHIGRAP^INT^1^59547,74872^0
TOHIGRAP ;
 
 
 
 Q:(DEV'=$$^%QZCHW("G"))&(DEV'=$$^%QZCHW("T"))
 K ^GRAPH($J)
 S %TERM=$S(DEV=$$^%QZCHW("G"):^TABIDENT(WHOIS,"TYPECR"),1:^TABIDENT(WHOIS,"TYPTAB")),%PORT=$S(DEV=$$^%QZCHW("G"):^TABIDENT(WHOIS,"ECRGRA"),1:^TABIDENT(WHOIS,"TABTRA")),ADR="CONV^TOHIGRAP",NOMTREE="^ARBTHEO(DOLARI,YA" D ^%QCAGTU1
NBL S DX=10,DY=10 X XY W !,$$^%QZCHW("Nombre de lignes par page  [10] ? : ") R NBL W:NBL="" "10" S:NBL="" NBL=10 I NBL'?.N D ^%VSQUEAK G NBL
NBNH S DX=10,DY=11 X XY W !,$$^%QZCHW("Nombre de noeuds par ligne [10] ? : ") R NBNH W:NBNH="" "10" S:NBNH="" NBNH=10 I NBNH'?.N D ^%VSQUEAK G NBNH
 D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant ... constitution de l'arbre en cours ...")
 D ^%VTHEURE K TEXT S TEXT(1)=$$^%QZCHW("Le ")_%DAT_$$^%QZCHW(" a ")_%HE,TEXT(2)=$$^%QZCHW("Arbre des composants pour : ")_YA,%NOEUD=YA D ^%PBMGRA3
 K ADR,F,^GRAPH($J),%HE,I,NBL,NBNH,NOMTREE,%NOEUD,REF,%TERM,TEXT,%PORT Q
CONV Q:%PR<4  S REF="" F I=3:1:%PR-1 S REF=REF_$S(REF="":"",1:",")_B(I)
 S F=@NOM,@("^GRAPH($J,^ARBTHEO(DOLARI,YA,"_REF_"),F)")="" Q

