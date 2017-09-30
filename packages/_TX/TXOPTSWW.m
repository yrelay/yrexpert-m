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

;TXOPTSWW^INT^1^59547,74877^0
TXOPTSWW(option) 
 ;;
 
 
 ;;
 
 
BEG k ^M($j) d @option
 q
capas ;;
 
 k ^Y($j) s ^Y($j)="30\BRHLY\3\ capacites de production "_"\\^M($j),10,3\2"
 s dollarh=$$out^%date(@etu@("Date de Depart")) d gooday^gensem(dollarh) s s=sem
loop s s1=s f %ii=0:1:9 d get
 d ^tokamak
 i RX=7 d pageup g loop
 i RX=8 d pagedn g loop
 i RX=0 d filly g loop
 q
get ;;
 s s=^semaine(^periode(s)+$s(%ii=0:0,1:1))
 
 d checksem(s,poste) s ^M($j,%ii+1,1)=s,^M($j,%ii+1,2)=$s($d(^capa(poste,s))=0:"indefini",1:^capa(poste,s)),^M($j,%ii+1,3)=^postes(poste,"unite de charge")
 q
 
 q
checksem(s,poste) 
 q:$d(^capa(poste,s))
 ;;
flash k Y,TJ s Y="10\BLRHYW\3\ valeurs par defaut \\",Y(1)="poste "_poste,Y(2)="capacite "_$s($d(^postes(poste,"defaut")):^postes(poste,"defaut"),1:40),Y(3)="charge nulle" d ^TKPOP
 s ^capa(poste,s)=$s($d(^postes(poste,"defaut")):^postes(poste,"defaut"),1:40),^charge(poste,s)=0 q
filly ;; transform la matrice m en vecteur y
 s m=$p(^Y($j),"\",6),nbli=$p(m,",",2),nbcol=$p(m,",",3),m=$p(m,",",1)
 k m1 s m1=$p(^Y($j),"\",7) f %i=1:1:$l(m1,",") s m1($p(m1,",",%i))=1
 f %i=1:1:nbli s ^capa(poste,@m@(%i,1))=@m@(%i,2)
 k m1
 q
pageup ;;
 d filly i s1=sem q
 s %p=^periode(s1)-10,%p=$s(%p>0:%p,1:1)
 s s=^semaine(%p)
 q
pagedn ;;
 d filly s s=^semaine(^periode(s1)+10)
 q

