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

;%TXVERIF^INT^1^59547,74033^0
%TXVERIF ;
 S NGL="^[""BB""]DOS",NBR="^NOMBRE"
 S %T="" F I=0:0 S %T=$O(@NGL@(%T)) Q:%T=""  D CLE2
 Q
CLE2 S %U="" F J=0:0 S %U=$O(@NGL@(%T,%U)) Q:%U=""  D CLE3
 Q
CLE3 S %V="" F K=0:0 S %V=$O(@NGL@(%T,%U,%V)) Q:%V=""  D CLE4
 Q
CLE4 I $D(@NGL@(%T,%U,%V))=10 D CLE5 Q
 S TYPE=$P(@NGL@(%T,%U,%V),"^",1)
 S DATE=$P(@NGL@(%T,%U,%V),"^",2)
 S DX=10,DY=20 X XY W "                                                                    "
 S DX=10,DY=20 X XY W "DOSSIER ",%T," ",TYPE," DATE : ",DATE D CNT
 Q
CLE5 S %W="",%W=$O(@NGL@(%T,%U,%V,%W))
 S TYPE=$P(@NGL@(%T,%U,%V,%W),"^",1)
 S DATE=$P(@NGL@(%T,%U,%V,%W),"^",2)
 S DX=10,DY=20 X XY W "                                                                    "
 S DX=10,DY=20 X XY W "DOSSIER ",%T," ",TYPE," DATE : ",DATE D CNT
 Q
CNT I TYPE="" Q
 I '($D(@NBR@(TYPE))) S @NBR@(TYPE)=0
 S @NBR@(TYPE)=@NBR@(TYPE)+1,@NBR@(TYPE,%T)=DATE
 
 Q
NETMP S GLO="^TEMPORAIRE",%U=10,%V="%LXSCOR",%W="ATTRIBUTS"
 S %T=""
 F I=0:0 S %T=$O(@GLO@(%U,%V,%W,%T)) Q:%T=""  D NET
 Q
NET W !,"ECRITURE DE ",%T," AU LEXIQUE" D MOT^%LXSTOCK(%T)
 Q
 ;
 ;

