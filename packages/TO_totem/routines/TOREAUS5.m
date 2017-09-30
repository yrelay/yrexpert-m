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

;TOREAUS5^INT^1^59547,74874^0
TOREAUS5 ;
 
 K ^REFPAR($I),^USIVU($I),^BLOCSUP($I),PARVAL($I),^VALPAR($I),^EXIPH($I) S YB=YA,NUMUS=-1,NBS=0,%MODNU=0 D EXIPH
 F %NN=1:1 S NUMUS=$N(^NBUSART($I,NUMUS)) Q:NUMUS=-1  S USI=-1 F %UU=1:1 S USI=$N(^NBUSART($I,NUMUS,USI)) Q:USI=-1  S NBUS=^NBUSART($I,NUMUS,USI) F %UN=1:1:NBUS D Q1
END K ^POSENR($I),^PARVAL($I),VALPAR($I),USIVU($I),NBUSART($I),DON($I) Q
Q1 S:'($D(^USIVU($I,USI))) ^USIVU($I,USI)=0 S ^USIVU($I,USI)=^USIVU($I,USI)+1,NNBB=^USIVU($I,USI)
 D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=USI_" No : "_NNBB D TO4^%VZCD
SUIT S %OYA=YA,YA=USI D ^TO4GEXPL S YA=%OYA D ^TOREAUS6
SUIT1 I %ABAND=1 D ^%VSQUEAK,POCLEPA^%VVIDEO W "Desirez-vous vraiment ne pas traiter cet usinage (O/N) ? " R *REP D TOUCHE^%INCCLAV(REP,.REP) G:(REP'=79)&(REP'=78) SUIT1 G:REP=79 FIN
S11 S %EXPERT=YB,NUM=-1,IDENT=USI_":"
 F UU=0:0 S NUM=$N(^TO4GEXPL($I,NUM)) Q:NUM=-1  S PARA=^PARVAL($I,USI,^TO4GEXPL($I,NUM)),IDENT=IDENT_PARA_","
 S IDENT=$E(IDENT,1,$L(IDENT)-1)
 S DX=0,DY=5 D CLEBAS^%VVIDEO,BLD^%VVIDEO S DX=0,DY=8 X XY W "Pour l'insertion de la phase : " D NORM^%VVIDEO S DX=0,DY=10 X XY W IDENT
OP D BLD^%VVIDEO S DX=0,DY=16 X XY W "Indiquez le nom de l'operation : " S DX=$X D NORM^%VVIDEO,^%VLEC G:CTRLA!CTRLF FIN G:Y1="" OP S OPER=Y1
NUO D TNBUO
NUO1 D BLD^%VVIDEO S DX=0,DY=18 X XY W "No d'ordre dans la gamme : " S DX=$X D NORM^%VVIDEO W ONUORD D ^%VLEC G:CTRLA!CTRLF FIN G:(Y1="")&(ONUORD="") NUO I Y1'="" S PCH=Y1 D TO^%QZNBN1 G:'(ISNUM) NUO1 S:ONUORD'="" %INCR=Y1-ONO
 S NUORD=$S(Y1'="":Y1,1:ONUORD)
 I $D(^REFPAR($I,YA,USI,NUORD))!$D(^EXIPH($I,NUORD)) D ^%VSQUEAK,POCLEPA^%VVIDEO W "Ce numero existe deja..." G NUO
 S ONUORD=NUORD,ONO=NUORD,NBS=NBS+1,^BLOCSUP($I,YA,NBS)=IDENT_"^"_OPER_"^"_NUORD,^REFPAR($I,YA,USI,NUORD,OPER)=$P(IDENT,":",2)
FIN Q
TNBUO I '($D(ONUORD)) S ONUORD="" Q
 G:$D(%INCR) FTNUO
 S PED=$L(ONUORD),LUM=0 F %PP=PED:-1:1 S NBRE=$E(ONUORD,%PP) Q:NBRE'=0  S LUM=LUM+10
 S %INCR=$S(LUM=0:1,1:LUM)
FTNUO S ONUORD=ONUORD+%INCR Q
EXIPH S HP=-1 F %HH=1:1 S HP=$N(^[QUI]PHASE(YA,HP)) Q:HP=-1  S PHNU=-1 F %PP=1:1 S PHNU=$N(^[QUI]PHASE(YA,HP,PHNU)) Q:PHNU=-1  S ^EXIPH($I,PHNU)=1
 Q

