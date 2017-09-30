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

;GLOAG^INT^1^59547,74867^0
GLOAG ;
 ;; gload manuel
 k nomglo u 0 w " a partir de " r nomglo i nomglo="" s nomglo="AAAAAAAAAAA"
 s nomglo(nomglo)=1
 s qui="ino"
 c 11 o 11:("r":"c:\ino\c5.01")
 c 12 o 12:("w":"imp.new") s chaine=""
 ;;
l2 d readcar
 i car'="^" d ignore g l2
debut ;;
 s debnom=2
loop ;; debut d'un global
 ;; son nom ---> prochaine parenthese
 s nglob=""
l1 d readcar
 i car'="(" s nglob=nglob_car g l1
ref ;; on a aquis un nom, on cherche une reference
 ;;u 0 w nglob
 s ref="",debref=pointe
l4 d readcar
 i car="""" d loopcar g l4
 i car'=")" g l4
 s finref=pointe-1,debval=pointe
 ;;
 ;; maintenant le separateur est precisement ce nom de global
 ;; on lit et charge
 ;; on prend tout ce qui est entre cotes
 ;; extraction : on diminue la chaine , on imprime l'extration
l5 ;;
 d readcar
 i car="""" d loopcar g l5
 i car'="^" g l5
 s oldpoint=pointe
 ;; lisons un peu la suite pour voir
l5s ;;
 d readcar
 i (car="(")&((pointe-oldpoint)>2) s pointe=oldpoint g l5t
 i $a(car)<64,(car+0)'=car s pointe=pointe-1 g l5 ;; on s'etait arrete trop tot .. et cas des chiffres
 i $a(car)>90 s pointe=pointe-1 g l5
 g l5s
l5t ;; ca ressemble effectivement a un global
 s finval=pointe-1
 i debnom'>0 s debnom=2
 s nom="^[qui]"_$e(chaine,debnom,debref-2)
 ;; test de nom de global
 s nm=$e(chaine,debnom,debref-2),%z="",%z=$o(nomglo(nm)) i %z'="" g l6
 s ref=$e(chaine,debref,debval-2)
 s valeur=$e(chaine,debval,finval-1)
 u 0 w !,"nom ",nom
 u 0 w !,"ref ",ref
 u 0 w !,"valeur ",valeur
 s @nom@(ref)=valeur
l6 ;; stockage effectif
 s chaine=$e(chaine,finval,$l(chaine))
 k pointe ;;;;s pointe=1
 s debnom=0
 g loop
loopcar ;;
 ;; on ignore les chaine de caracteres
 f %z=0:1 d readcar q:car=""""
 q
readcar ;;
 i '($d(pointe)) s pointe=1
 i pointe>$l(chaine) d read
 ;;i pointe=0 d read
 s car=$e(chaine,pointe)
 s pointe=pointe+1
 q
read ;;
 u 11 r enreg
 s chaine=chaine_enreg
 q
ignore ;;
 s chaine=$e(chaine,pointe,$l(chaine))
 k pointe ;;;;;s pointe=1
 q
 ;

