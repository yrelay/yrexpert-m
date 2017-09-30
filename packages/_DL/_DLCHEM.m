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

;%DLCHEM^INT^1^59547,73867^0
JLCHEM ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
LONG(DESOP,GRAPH,GRAPHINV,CHEM,PLPREC,LONGCHEM,MAX) 
 N SOM,NONTRAIT,D,PREC,SOM2,L,LET,SOMAX,PREC2
 S ERR=0
 I '($D(@GRAPH)) S ERR=35 Q 0
 S LIB=$$^%QZCHW("Jalon entre")_" ",LET=$$^%QZCHW("et")
 S MAX=0
 K @(CHEM),@(PLPREC),@(LONGCHEM)
 
 S SOMAX=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"PLUS.SOM")
 S NONTRAIT=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"NON.TRAITES")
 K @(NONTRAIT),@(SOMAX)
 S SOM=""
 F D=0:0 S SOM=$O(@GRAPH@(SOM)) Q:SOM=""  S @NONTRAIT@(SOM)=""
 F D=0:0 S SOM=$O(@GRAPHINV@(SOM)) Q:SOM=""  S @NONTRAIT@(SOM)=""
 
 S SOM=""
BPLUSL S SOM=$O(@GRAPH@(SOM))
 G:SOM="" BPLUSL2
 G:$D(@GRAPHINV@(SOM)) BPLUSL
 
 S @CHEM@(SOM)=0
 K @NONTRAIT@(SOM)
 G BPLUSL
 
 
BPLUSL2 S SOM=$O(@NONTRAIT@(SOM))
 G:SOM="" BPLUSL5
 S SOM2="",D=-999999,PREC=""
BPLUSL3 S SOM2=$O(@GRAPHINV@(SOM,SOM2))
 G:SOM2="" BPLUSL4
 G:$D(@NONTRAIT@(SOM2)) BPLUSL2
 S:(@GRAPH@(SOM2,SOM)+@CHEM@(SOM2))>D D=@GRAPH@(SOM2,SOM)+@CHEM@(SOM2),PREC=SOM2
 G BPLUSL3
 
BPLUSL4 S @CHEM@(SOM)=D
 S @PLPREC@(SOM,PREC)=LIB_@DESOP@(PREC)_" "_LET_" "_@DESOP@(SOM)_" : "_@GRAPH@(PREC,SOM)
 S:D=MAX @SOMAX@(SOM)=""
 I D>MAX K @(SOMAX) S MAX=D,@SOMAX@(SOM)=""
 K @NONTRAIT@(SOM)
 S SOM=""
 G BPLUSL2
 
BPLUSL5 
 I $D(@NONTRAIT) K @(SOMAX),@(NONTRAIT) S ERR=36 Q 0
 S SOM=""
BPLUSL6 S SOM=$O(@SOMAX@(SOM))
 G:SOM="" FPLUSL
 S PREC=SOM
BPLUSL7 S PREC2=$O(@PLPREC@(PREC,""))
 G:PREC2="" BPLUSL6
 S @LONGCHEM@(@DESOP@(PREC2),@DESOP@(PREC))=""
 S PREC=PREC2
 G BPLUSL7
 
FPLUSL K @(SOMAX)
 Q 1

