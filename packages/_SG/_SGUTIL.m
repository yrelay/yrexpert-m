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

;%SGUTIL^INT^1^59547,73891^0
%SGUTIL ;;02:46 PM  4 Sep 1996; 05 Nov 92  5:09 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
INITFIFO() N G,V
 S G="^TEMPORAI("_$J_","""_$P($ZPOS,"^",2)_""",""F"")"
 S:'($D(@G)#10) @G=0 S (@G,V)=@G+1,@G@(V,"ADR")=$$TEMP
 S (@G@(V,"DEB"),@G@(V,"FIN"))=1
 Q V
PULLFIFO(IFIFO) N G,ADR,RES
 S $ZT="PULLERR"
 S G="^TEMPORAI("_$J_","""_$P($ZPOS,"^",2)_""",""F"")"
 S ADR=@G@(IFIFO,"ADR")
 S RES=@ADR@(@G@(IFIFO,"DEB")),@G@(IFIFO,"DEB")=@G@(IFIFO,"DEB")+1
 S $ZT="" Q RES
PULLERR S $ZT="" Q ""
 
PUSHFIFO(IFIFO,VAL) N G,ADR
 S $ZT="PUSHERR"
 S G="^TEMPORAI("_$J_","""_$P($ZPOS,"^",2)_""",""F"")"
 S ADR=@G@(IFIFO,"ADR")
 S @ADR@(@G@(IFIFO,"FIN"))=VAL,@G@(IFIFO,"FIN")=@G@(IFIFO,"FIN")+1
 S $ZT="" Q
PUSHERR S $ZT="" Q
 
KILLFIFO(IFIFO) N G,ADR
 S $ZT="KILLERR"
 S G="^TEMPORAI("_$J_","""_$P($ZPOS,"^",2)_""",""F"")"
 S ADR=@G@(IFIFO,"ADR")
 K @(ADR),@G@(IFIFO)
 S $ZT="" Q
KILLERR S $ZT="" Q
 
 
 
INITLIFO() N G,V
 S G="^TEMPORAI("_$J_","""_$P($ZPOS,"^",2)_""",""L"")"
 S:'($D(@G)#10) @G=0 S (@G,V)=@G+1,@G@(V,"ADR")=$$TEMP
 S @G@(V,"FIN")=0
 Q V
PULLLIFO(ILIFO) N G,ADR,RES
 S $ZT="PULLERR"
 S G="^TEMPORAI("_$J_","""_$P($ZPOS,"^",2)_""",""L"")"
 S ADR=@G@(ILIFO,"ADR")
 S RES=@ADR@(@G@(ILIFO,"FIN")),@G@(ILIFO,"FIN")=@G@(ILIFO,"FIN")-1
 S $ZT="" Q RES
 
PUSHLIFO(ILIFO,VAL) N G,ADR
 S $ZT="PUSHERR"
 S G="^TEMPORAI("_$J_","""_$P($ZPOS,"^",2)_""",""L"")"
 S ADR=@G@(ILIFO,"ADR")
 S @G@(ILIFO,"FIN")=@G@(ILIFO,"FIN")+1,@ADR@(@G@(ILIFO,"FIN"))=VAL
 S $ZT="" Q
 
MRKLIFO(ILIFO) 
 N G,ADR
 S G="^TEMPORAI("_$J_","""_$P($ZPOS,"^",2)_""",""L"")"
 S ADR=@G@(ILIFO,"ADR")
 S @ADR@(@G@(ILIFO,"FIN"),"MRK")=""
 S $ZT="" Q
 
PMRKLIFO(ILIFO) 
 N G,ADR,MRK,%M
 S G="^TEMPORAI("_$J_","""_$P($ZPOS,"^",2)_""",""L"")"
 S ADR=@G@(ILIFO,"ADR"),MRK=@G@(ILIFO,"FIN")
 F %M=0:0 Q:$D(@ADR@(MRK,"MRK"))  S MRK=$ZP(@ADR@(MRK))
 S %M=@ADR@(MRK)
 S @G@(ILIFO,"FIN")=MRK
 Q %M
 
TOPLIFO(ILIFO) N G,ADR
 S $ZT="PULLERR"
 S G="^TEMPORAI("_$J_","""_$P($ZPOS,"^",2)_""",""L"")"
 S ADR=@G@(ILIFO,"ADR")
 S RES=@ADR@(@G@(ILIFO,"FIN"))
 S $ZT="" Q RES
 
KILLLIFO(ILIFO) N G,ADR
 S $ZT="KILLERR"
 S G="^TEMPORAI("_$J_","""_$P($ZPOS,"^",2)_""",""L"")"
 S ADR=@G@(ILIFO,"ADR")
 K @(ADR),@G@(ILIFO)
 S $ZT="" Q
 
 
TEMP() N G
 S G="^TEMPORAI("_$J_","""_$P($ZPOS,"^",2)_""",""Z"")"
 I '($D(@G)#10) S @G=0
 S @G=@G+1 Q "^TEMPORAI("_$J_","""_$P($ZPOS,"^",2)_""",""Z"","_@G_")"
 
 
EMPV(%G2) 
 N %G S %G="^TEMPORAI("_$J_","""_$P($ZPOS,"^",2)_""",""V"")"
 I '($D(@%G)#10) S @%G=0
 S (%G(1),@%G)=@%G+1
 
 S %G(4)=""
EMPVBC S %G(4)=$O(@%G2@("I",%G(4))) G:%G(4)="" EMPVSUI
 S %G(0)=@%G2@("I",%G(4))
 S @%G@(@%G,"L",%G(0))=""
 S:$D(@%G(0))#10 @%G@(@%G,"V",%G(0))=@%G(0)
 S %G(2)=%G(0)
 ;; cao debug ^%Q
 F %G(3)=1:1 S %G(2)=$$^%Q($Q(@%G(2))) Q:%G(2)=""  Q:$E(%G(2),1,$L(%G(0)))'=%G(0)  S @%G@(@%G,"V",%G(2))=@%G(2)
 
 G EMPVBC
EMPVSUI 
 S %G(4)=""
 S %G(4)=$O(@%G2@("E",%G(4))) G:%G(4)="" EMPVFIN
 S %G(0)=@%G2@("E",%G(4))
 S @%G@(@%G,"L",%G(0))=""
 S:$D(@%G(0))#10 @%G@(@%G,"V",%G(0))=@%G(0)
 S %G(2)=%G(0)
 ;; cao debug ^%Q
 F %G(3)=1:1 S %G(2)=$$^%Q($Q(@%G(2))) Q:%G(2)=""  Q:$E(%G(2),1,$L(%G(0)))'=%G(0)  S @%G@(@%G,"V",%G(2))=@%G(2)
 
 G EMPVBC
EMPVFIN Q
 
 
 
DEPV N %G S %G="^TEMPORAI("_$J_","""_$P($ZPOS,"^",2)_""",""V"")"
 I '($D(@%G)) Q
 S %G(4)=""
DEPVBC S %G(4)=$O(@%G@(@%G,"L",%G(4))) G:%G(4)="" DEPVSUI
 K @(%G(4)) G DEPVBC
DEPVSUI S %G(2)=""
 F %G(3)=1:1 S %G(2)=$O(@%G@(@%G,"V",%G(2))) Q:%G(2)=""  S @(%G(2)_"=@%G@(@%G,""V"",%G(2))")
 K @%G@(@%G) S @%G=@%G-1
 Q

