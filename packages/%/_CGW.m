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
;! Nomprog     : %CGW                                                         !
;! Module      : Caractères graphiques (CG)                                   !
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

%CGW ;
CGW(E,L) 
 N C S C="*" G GO
2(E,L,C) 
 G GO
T0(E,L) N C S C="*" D:($X+$L(C))>79 POCLEPA^%VVIDEO G GO
T(E,L,C) 
 D:($X+$L(C))>79 POCLEPA^%VVIDEO G GO
GO I ((E="")!(L=""))!(^TOZE($I,"TYPTERM")'="VT220") W C Q
 I '($D(^CAGRAPH(E,"LETTRES",L))) W "*" Q
 W ^CAGRAPH(E,"LETTRES",L) Q
 S:'($D(NOCG)) NOCG=63
 I '($D(CGEN(E))) S NOCG=NOCG+1,CGEN(E)=" "_$C(NOCG) D UN^%CGLOAD(E)
 W *27,"*",CGEN(E),*27,"N",$C(CGEN(E,L)) S $X=$X-1 Q
TEXT(E,L,C) I ((E="")!(L=""))!(^TOZE($I,"TYPTERM")'="VT220") Q C
 I '($D(^CAGRAPH(E,"LETTRES",L))) Q C
 S:'($D(NOCG)) NOCG=63
 I '($D(CGEN(E))) S NOCG=NOCG+1,CGEN(E)=" "_$C(NOCG) D UN^%CGLOAD(E)
 Q $C(27)_"*"_CGEN(E)_$C(27)_"N"_$C(CGEN(E,L))
 
 ;HL TEXT(E,L,CAR)
 ;       G GO
 
INIT D CLEPAG^%VVIDEO N L
L0 W !,"Ligne ayant un terminal compatible VT220 : " R L Q:L=""
 D OKT(L) G L0
SUPP D CLEPAG^%VVIDEO N L
L1 W !,"Ligne n'ayant pas un terminal compatible VT220 : " R L Q:L=""
 D NOKT(L) G L0
OK S ^TOZE($I,"TYPTERM")="VT220" Q
NOK S ^TOZE($I,"TYPTERM")="VT100" Q
OKT(T) S ^TOZE(T,"TYPTERM")="VT220" Q
NOKT(T) S ^TOZE(T,"TYPTERM")="VT100" Q

