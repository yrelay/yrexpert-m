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

;%VPRXLI^INT^1^59547,74036^0
REGLIST ;
 
BEG D CLEPAG^%VVIDEO W ! S TYPI=$T(TYPIMP),TYPI=$P(TYPI,";;",2) F TI=1:1 S IM=$P(TYPI,";",TI) Q:IM=""  W !,TI,"      ",IM
 S DX=0,DY=1 X XY W $$^%QZCHW("Choix de l'imprimante : ") R CI S CI=$J(CI,1,0) G:(CI<1)!(CI'<TI) BEG
SUIT D CLEPAG^%VVIDEO W ! S TYPL=$T(TYPLIS),TYPL=$P(TYPL,";;",2) F TL=1:1 S LST=$P(TYPL,";",TL) Q:LST=""  W !,TL,"      ",LST
 S DX=0,DY=1 X XY W $$^%QZCHW("Choix du listing : ") R CL S CL=$J(CL,1,0) G:(CL<1)!(CL'<TL) SUIT
 D CURRENT^%IS S IMPR=^TABIDENT(WHOIS,"PRINTER") O IMPR U IMPR S IOP=IMPR D ^%IS W *-1
 S RDA=CI_CL D @RDA
 O 0 U 0 D ^%VSQUEAK W !,$$^%QZCHW(" VEUILLEZ, SUR L'IMPRIMANTE"),!,?10,$$^%QZCHW("1) REGLER LE PAPIER"),!,?10,$$^%QZCHW("2) FAIRE UN 'TOF'"),!,?10,$$^%QZCHW("3) A L'ECRAN, FAIRE 'RETURN' QUAND VOUS ETES PRET ") R XXXX D CLEPAG^%VVIDEO,POCLEPA^%VVIDEO W $$^%QZCHW(" IMPRIMANTE PRETE...")
 O IMPR U IMPR W #
 C IMPR Q
11 W *27,*52,"066" S ^IMPRCOUR(WHOIS)=66 Q
12 W *27,*52,"051" S ^IMPRCOUR(WHOIS)=51 Q
13 D GNBLG S NBLG=$J(NBLG,1,0),^IMPRCOUR(WHOIS)=NBLG S:NBLG<10 NBLG="00"_NBLG S:NBLG<100 NBLG="0"_NBLG U IMPR W *27,*52,NBLG Q
21 W *27,"[66t" S ^IMPRCOUR(WHOIS)=66 Q
22 W *27,"[51t" S ^IMPRCOUR(WHOIS)=51 Q
23 D GNBLG S NBLG=$J(NBLG,1,0),^IMPRCOUR(WHOIS)=NBLG,NBLG="["_NBLG_$$^%QZCHW("t") U IMPR W *27,NBLG Q
31 W *27,"v66,0" S ^IMPRCOUR(WHOIS)=66 Q
32 W *27,"v51,0" S ^IMPRCOUR(WHOIS)=51 Q
33 D GNBLG S NBLG=$J(NBLG,1,0),^IMPRCOUR(WHOIS)=NBLG,NBLG="v"_NBLG_",0" U IMPR W *27,NBLG Q
41 W *27,"[66t,0" S ^IMPRCOUR(WHOIS)=66 Q
42 W *27,"[51t,0" S ^IMPRCOUR(WHOIS)=66 Q
43 D GNBLG S NBLG=$J(NBLG,1,0),^IMPRCOUR(WHOIS)=NBLG,NBLG="["_NBLG_$$^%QZCHW("t") U IMPR W *27,NBLG Q
GNBLG U 0 W !,$$^%QZCHW("nombre de lignes (<999) : ") R NBLG I (NBLG<0)!(NBLG>999) D ^%VSQUEAK G GNBLG
 Q
TYPIMP ;;LC25;LC35;LA50;CENTRONICS
TYPLIS ;;GRAND PAPIER;LISTING VERT;AUTRE

