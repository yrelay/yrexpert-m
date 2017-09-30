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

;LKBND^INT^1^59547,74867^0
LKBND ;
 ;;ventilation du fichier BT pour traitement ult
 ;;rieur par passerelle
 o 10:("R":"C:\BND\BT.BND")
 o 11:("W":"c:\bnd\BT01.BND")
 o 16:("W":"c:\bnd\BT02.BND")
 o 17:("W":"c:\bnd\BT03.BND")
 o 12:("W":"c:\bnd\BT2.BND")
 o 13:("W":"c:\bnd\BT3.BND")
 o 14:("W":"c:\bnd\BT4.BND")
 o 15:("W":"c:\bnd\BT5.BND")
 ;; fichier 10 celui d'origine :C:\BND\BT.BND
 ;;	   11 caracterisation du produit 16 et 17
 ;;	   12 nomenclature premier niveau
 ;;	   13,14, 15 : gamme a ,b, c
 s numfile(" B")=11,numfile(" C")=16,numfile(" H")=17
 s numfile(" K")=12,numfile("A")=13,numfile("B")=14,numfile("C")=15
 ;;
loop ;;
 ;;
 u 10 r enr s %R=$zdev("R",10)
 u 0 w !,">>>>",%R,"<<<<" s %STATUT=$p(%R,",",1)
 ;; q si fin de fichier
 q:%STATUT=3
 u 0 w !,enr
 s pos=$e(enr,8,9),p=$s($e(pos,1)'=" ":8,1:9) g loop:'($d(numfile($e(enr,8,p)))) s f=numfile($e(enr,8,p))
 u 0 w "file ",f
 u f w enr_$c(12)_$c(10)
 g loop

